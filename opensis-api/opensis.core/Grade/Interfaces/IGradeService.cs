﻿using opensis.data.Models;
using opensis.data.ViewModels.Grades;
using System;
using System.Collections.Generic;
using System.Text;

namespace opensis.core.Grade.Interfaces
{
    public interface IGradeService
    {
        public GradeScaleAddViewModel AddGradeScale(GradeScaleAddViewModel gradeScaleAddViewModel);
        public GradeScaleAddViewModel UpdateGradeScale(GradeScaleAddViewModel gradeScaleAddViewModel);
        public GradeScaleAddViewModel DeleteGradeScale(GradeScaleAddViewModel gradeScaleAddViewModel);
        public GradeAddViewModel AddGrade(GradeAddViewModel gradeAddViewModel);
        public GradeAddViewModel UpdateGrade(GradeAddViewModel gradeAddViewModel);
        public GradeAddViewModel DeleteGrade(GradeAddViewModel gradeAddViewModel);
        public GradeScaleListViewModel GetAllGradeScaleList(GradeScaleListViewModel gradeScaleListViewModel);
        public GradeSortOrderModel UpdateGradeSortOrder(GradeSortOrderModel gradeSortOrderModel);
        public EffortGradeLibraryCategoryAddViewModel AddEffortGradeLibraryCategory(EffortGradeLibraryCategoryAddViewModel effortGradeLibraryCategoryAddViewModel);
        public EffortGradeLibraryCategoryAddViewModel UpdateEffortGradeLibraryCategory(EffortGradeLibraryCategoryAddViewModel effortGradeLibraryCategoryAddViewModel);
        public EffortGradeLibraryCategoryAddViewModel DeleteEffortGradeLibraryCategory(EffortGradeLibraryCategoryAddViewModel effortGradeLibraryCategoryAddViewModel);
        public EffortGradeLibraryCategoryItemAddViewModel AddEffortGradeLibraryCategoryItem(EffortGradeLibraryCategoryItemAddViewModel effortGradeLibraryCategoryItemAddViewModel);
        public EffortGradeLibraryCategoryItemAddViewModel UpdateEffortGradeLibraryCategoryItem(EffortGradeLibraryCategoryItemAddViewModel effortGradeLibraryCategoryItemAddViewModel);
        public EffortGradeLibraryCategoryItemAddViewModel DeleteEffortGradeLibraryCategoryItem(EffortGradeLibraryCategoryItemAddViewModel effortGradeLibraryCategoryItemAddViewModel);
        public EffortGradeLlibraryCategoryListViewModel GetAllEffortGradeLlibraryCategoryList(EffortGradeLlibraryCategoryListViewModel effortGradeLlibraryCategoryListViewModel);
        public EffortgradeLibraryCategorySortOrderModel UpdateEffortGradeLlibraryCategorySortOrder(EffortgradeLibraryCategorySortOrderModel effortgradeLibraryCategorySortOrderModel);
        
        public EffortGradeScaleAddViewModel AddEffortGradeScale(EffortGradeScaleAddViewModel effortGradeScaleAddViewModel);
        public EffortGradeScaleAddViewModel UpdateEffortGradeScale(EffortGradeScaleAddViewModel effortGradeScaleAddViewModel);
        public EffortGradeScaleAddViewModel DeleteEffortGradeScale(EffortGradeScaleAddViewModel effortGradeScaleAddViewModel);
        public EffortGradeScaleListModel GetAllEffortGradeScale(PageResult pageResult);
        public EffortGradeScaleSortOrderViewModel UpdateEffortGradeScaleSortOrder(EffortGradeScaleSortOrderViewModel effortGradeScaleSortOrderViewModel);
    }
}