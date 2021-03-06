﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Antiforgery;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using opensis.core.User.Interfaces;
using opensis.data.ViewModels.User;

namespace opensisAPI.Controllers
{
    [EnableCors("AllowOrigin")]
    [Route("{tenant}/User")]
    [ApiController]    
    public class UserController : ControllerBase
    {
        private IUserService _userService;
        private readonly IAntiforgery _antiForgery;
        private readonly IConfiguration _configuration;
        public UserController(IUserService userService,IServiceProvider serviceProvider, IConfiguration configuration)
        {
            _userService = userService;
            this._configuration = configuration;

            if (this._configuration.GetValue<bool>("AntiForgeryTokenValidationEnabled"))
                this._antiForgery = serviceProvider.GetService<IAntiforgery>();
        }

        /// <summary>
        /// This is used for authentcatred the login process
        /// </summary>
        /// <param name="objModel"></param>
        /// <returns></returns>

        [HttpPost("ValidateLogin")]
        public ActionResult<LoginViewModel> ValidateLogin(LoginViewModel objModel)
        {
            var response=  _userService.ValidateUserLogin(objModel);
            if (this._configuration.GetValue<bool>("AntiForgeryTokenValidationEnabled"))
                this.GenerateAntiForgeryToken(response._tokenExpiry);
            return response;
        }

        [HttpPost("checkUserLoginEmail")]
        public ActionResult<CheckUserEmailAddressViewModel> CheckUserLoginEmail(CheckUserEmailAddressViewModel checkUserEmailAddressViewModel)
        {
            CheckUserEmailAddressViewModel checkUserEmailAddress = new CheckUserEmailAddressViewModel();
            try
            {
                checkUserEmailAddress = _userService.CheckUserLoginEmail(checkUserEmailAddressViewModel);

            }
            catch (Exception es)
            {
                checkUserEmailAddress._message = es.Message;
                checkUserEmailAddress._failure = true;
            }
            return checkUserEmailAddress;
        }

        [HttpPost("RefreshToken")]
        [AllowAnonymous]
        public ActionResult<LoginViewModel> RefreshToken(LoginViewModel objModel)
        {
            var response = _userService.RefreshToken(objModel);

            if (this._configuration.GetValue<bool>("AntiForgeryTokenValidationEnabled"))
                this.GenerateAntiForgeryToken(response._tokenExpiry);

            return response;
        }
        private void GenerateAntiForgeryToken(System.DateTimeOffset tokenExpiry)
        {
            var tokens = _antiForgery.GetAndStoreTokens(HttpContext);
            var cookieOptions = new CookieOptions()
            {
                Domain = $"{HttpContext.Request.Scheme}://{HttpContext.Request.Host.Value}",
                Expires = tokenExpiry,
                HttpOnly = this._configuration.GetValue<bool>("AntiForgeryHttpOnly"),
                Secure = this._configuration.GetValue<bool>("AntiForgerySecureCookie")
            };
            Response.Cookies.Append("XSRF-TOKEN", tokens.RequestToken, options: cookieOptions);
        }
    }
}
