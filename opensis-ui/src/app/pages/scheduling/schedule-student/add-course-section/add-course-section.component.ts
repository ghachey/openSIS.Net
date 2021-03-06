import { Component, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { SearchStudentCourseSection } from '../../../../models/search-student-course-section.model';
import icClose from '@iconify/icons-ic/twotone-close';
import { TranslateService } from '@ngx-translate/core';
import { CourseManagerService } from '../../../../services/course-manager.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import { AllCourseSectionView, GetAllCourseListModel, GetAllProgramModel, GetAllSubjectModel, SearchCourseSectionViewModel } from '../../../../models/course-manager.model';
import { GetMarkingPeriodTitleListModel, MarkingPeriodTitleList } from '../../../../models/marking-period.model';
import { MarkingPeriodService } from '../../../../services/marking-period.service';
import { LoaderService } from '../../../../services/loader.service';
import { takeUntil } from 'rxjs/operators';
import { Subject } from 'rxjs';
import { NgForm } from '@angular/forms';
import { MatTableDataSource } from '@angular/material/table';
import { MatPaginator } from '@angular/material/paginator';
import { SelectionModel } from '@angular/cdk/collections';
import { CourseSectionService } from '../../../../services/course-section.service';
import { MatDialogRef } from '@angular/material/dialog';
import { MatCheckbox } from '@angular/material/checkbox';

@Component({
  selector: 'vex-add-course-section',
  templateUrl: './add-course-section.component.html',
  styleUrls: ['./add-course-section.component.scss']
})
export class AddCourseSectionComponent implements OnInit, OnDestroy {
  getAllProgramModel: GetAllProgramModel = new GetAllProgramModel();
  getAllSubjectModel: GetAllSubjectModel = new GetAllSubjectModel();
  getAllCourseListModel: GetAllCourseListModel = new GetAllCourseListModel();
  getMarkingPeriodTitleListModel: GetMarkingPeriodTitleListModel = new GetMarkingPeriodTitleListModel();
  courseSectionSearch: SearchCourseSectionViewModel = new SearchCourseSectionViewModel();
  programList = [];
  subjectList = [];
  courseList = [];
  markingPeriodList = [];
  searchRecord: boolean = false;
  loading: boolean;
  destroySubject$: Subject<void> = new Subject();
  @ViewChild('f') currentForm: NgForm;
  @ViewChild(MatPaginator, { static: false }) paginator: MatPaginator;
  @ViewChild('masterCheckBox') masterCheckBox: MatCheckbox;
  courseDetails: MatTableDataSource<any>;
  icClose = icClose;
  selection: SelectionModel<AllCourseSectionView> = new SelectionModel<AllCourseSectionView>(true, []);
  displayedColumns: string[] = ['courseSelected', 'course', 'courseSection', 'markingPeriod', 'startDate', 'endDate', 'seats', 'available'];
  selectedMarkingPeriod: MarkingPeriodTitleList = new MarkingPeriodTitleList();

  constructor(public translateService: TranslateService,
    private dialogRef: MatDialogRef<AddCourseSectionComponent>,
    private courseManagerService: CourseManagerService,
    private snackbar: MatSnackBar,
    private markingPeriodService: MarkingPeriodService,
    private loaderService: LoaderService,
    private courseSectionService: CourseSectionService) {
    translateService.use('en');
    this.loaderService.isLoading.pipe(takeUntil(this.destroySubject$)).subscribe((val) => {
      this.loading = val;
    });
  }

  ngOnInit(): void {
    this.getAllCourse();
    this.getAllSubjectList();
    this.getAllProgramList();
    this.getAllMarkingPeriodList();
  }


  getAllProgramList() {
    this.courseManagerService.GetAllProgramsList(this.getAllProgramModel).subscribe(data => {
      this.programList = data.programList;
    });
  }
  getAllSubjectList() {
    this.courseManagerService.GetAllSubjectList(this.getAllSubjectModel).subscribe(data => {
      this.subjectList = data.subjectList;

    });
  }

  getAllMarkingPeriodList() {
    this.getMarkingPeriodTitleListModel.schoolId = +sessionStorage.getItem("selectedSchoolId");
    this.getMarkingPeriodTitleListModel.academicYear = +sessionStorage.getItem("academicyear");
    this.markingPeriodService.getAllMarkingPeriodList(this.getMarkingPeriodTitleListModel).subscribe(data => {
      if (data._failure) {
        this.getMarkingPeriodTitleListModel.getMarkingPeriodView = [];
      } else {
        this.getMarkingPeriodTitleListModel.getMarkingPeriodView = data.getMarkingPeriodView;
      }
    });
  }

  changeMarkingPeriod(markingPeriodId) {
    let index = this.getMarkingPeriodTitleListModel.getMarkingPeriodView.findIndex((item) => {
      return item.value == markingPeriodId
    })
    this.selectedMarkingPeriod = this.getMarkingPeriodTitleListModel.getMarkingPeriodView[index];
  }

  getAllCourse() {
    this.courseManagerService.GetAllCourseList(this.getAllCourseListModel).subscribe(data => {
      if (data._failure) {
        this.courseList = [];
      } else {
        this.courseList = data.courseViewModelList;

      }
    })
  }

  searchCourseSection() {
    this.searchRecord = true;
    this.courseSectionService.searchCourseSectionForSchedule(this.courseSectionSearch).subscribe((res) => {
      if (res._failure) {
        if (res.allCourseSectionViewList === null) {
          this.courseDetails = new MatTableDataSource([]);
          this.snackbar.open(res._message, '', {
            duration: 5000
          });
        } else {
          this.courseDetails = new MatTableDataSource([]);
        }
      } else {
        res.allCourseSectionViewList = this.findMarkingPeriodTitleById(res.allCourseSectionViewList);
        this.courseDetails = new MatTableDataSource(res.allCourseSectionViewList);
        this.courseDetails.paginator = this.paginator;
      }
    })
  }

  findMarkingPeriodTitleById(courseDetails) {
    courseDetails = courseDetails.map((item) => {
      if (item.yrMarkingPeriodId) {
        item.yrMarkingPeriodId = '0_' + item.yrMarkingPeriodId;
      } else if (item.smstrMarkingPeriodId) {
        item.smstrMarkingPeriodId = '1_' + item.smstrMarkingPeriodId;
      } else if (item.qtrMarkingPeriodId) {
        item.qtrMarkingPeriodId = '2_' + item.qtrMarkingPeriodId;
      }

      if (item.yrMarkingPeriodId || item.smstrMarkingPeriodId || item.qtrMarkingPeriodId) {
        for (let markingPeriod of this.getMarkingPeriodTitleListModel.getMarkingPeriodView) {
          if (markingPeriod.value == item.yrMarkingPeriodId) {
            item.markingPeriodTitle = markingPeriod.text;
            break;
          } else if (markingPeriod.value == item.smstrMarkingPeriodId) {
            item.markingPeriodTitle = markingPeriod.text;
            break;
          } else if (markingPeriod.value == item.qtrMarkingPeriodId) {
            item.markingPeriodTitle = markingPeriod.text;
            break;
          }
        }
      } else {
        item.markingPeriodTitle = 'Custom'
      }
      return item;
    });
    return courseDetails;
  }


  addCourseSection() {
    let numSelected = this.selection.selected;
    let courseSectionReturnList = numSelected.map((item) => {
      if (item.yrMarkingPeriodId) {
        let yrMarkingPeriodId = item.yrMarkingPeriodId.toString().split('_');
        item.yrMarkingPeriodId = parseInt(yrMarkingPeriodId[1]);
      } else if (item.smstrMarkingPeriodId) {
        let smstrMarkingPeriodId = item.smstrMarkingPeriodId.toString().split('_');
        item.smstrMarkingPeriodId = parseInt(smstrMarkingPeriodId[1]);
      } else if (item.qtrMarkingPeriodId) {
        let qtrMarkingPeriodId = item.qtrMarkingPeriodId.toString().split('_');
        item.qtrMarkingPeriodId = parseInt(qtrMarkingPeriodId[1]);
      }
      return item;
    })
    if (courseSectionReturnList.length > 0) {
      this.dialogRef.close(courseSectionReturnList);

    } else {
      this.snackbar.open('Please select at least 1 course section', '', {
        duration: 2000
      });
    }

  }

  /** Whether the number of selected elements matches the total number of rows. */
  isAllSelected() {
    const numSelected = this.selection.selected.length;
    return numSelected === this.courseDetails.paginator.pageSize;
  }

  checked(row: any) {
    this.selection.select(row)
    let found = this.selection.selected.find(x => x.courseSectionId == row.courseSectionId);
    if (this.courseDetails.data.length < 12 && this.courseDetails.data.length == this.selection.selected.length) {
      this.masterCheckBox.checked = true;
    }
    if (found) {
      return true;
    }
  }

  unChecked(row: any) {
    if (this.courseDetails.data.length < 12) {
      this.masterCheckBox.checked = false;
    }

    let found = this.selection.selected.find(x => x.courseSectionId == row.courseSectionId);
    // if (found) found.checked = false;
    this.selection.deselect(found);

    if (found) {
      return false;
    }
  }

  isChecked(row: any) {
    let found = this.selection.selected.find(x => x.courseSectionId == row.courseSectionId);

    if (found) {
      return true;
    }
  }

  /** Selects all rows if they are not all selected; otherwise clear selection. */
  masterToggle(event) {
    this.isAllSelected() ?
      this.selection.clear() :
      this.selectRows();

    if (!event && this.courseDetails.data.length < 12) {
      for (let courseSection of this.courseDetails.data) {
        this.unChecked(courseSection);
      }
    }
  }

  selectRows() {
    for (let index = 0; index < this.courseDetails.paginator.pageSize; index++) {
      if (this.courseDetails.data[index]) {
        this.selection.select(this.courseDetails.data[index]);
      }
      // this.selectionAmount = this.selection.selected.length;
    }
  }


  ngOnDestroy() {
    this.destroySubject$.next();
    this.destroySubject$.complete();
  }

}
