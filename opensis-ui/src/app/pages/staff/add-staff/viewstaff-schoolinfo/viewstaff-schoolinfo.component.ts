import { Component, OnInit } from '@angular/core';
import { fadeInUp400ms } from '../../../../../@vex/animations/fade-in-up.animation';
import { stagger60ms } from '../../../../../@vex/animations/stagger.animation';
import { fadeInRight400ms } from '../../../../../@vex/animations/fade-in-right.animation';
import { TranslateService } from '@ngx-translate/core';
import icCheckBox from '@iconify/icons-ic/check-box';
import icCheckBoxOutlineBlank from '@iconify/icons-ic/check-box-outline-blank';
import icEdit from '@iconify/icons-ic/edit';

@Component({
  selector: 'vex-viewstaff-schoolinfo',
  templateUrl: './viewstaff-schoolinfo.component.html',
  styleUrls: ['./viewstaff-schoolinfo.component.scss'],
  animations: [
    stagger60ms,
    fadeInUp400ms,
    fadeInRight400ms
  ]
})
export class ViewstaffSchoolinfoComponent implements OnInit {

  icEdit = icEdit;

  constructor(public translateService:TranslateService) {
    translateService.use('en');
  }

  ngOnInit(): void {
  }

}
