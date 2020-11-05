import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { fadeInUp400ms } from '../../../../../@vex/animations/fade-in-up.animation';
import { stagger60ms } from '../../../../../@vex/animations/stagger.animation';
import { fadeInRight400ms } from '../../../../../@vex/animations/fade-in-right.animation';
import { MatDialog } from '@angular/material/dialog';
import icAdd from '@iconify/icons-ic/baseline-add';
import { EnrollToSchoolComponent } from './enroll-to-school/enroll-to-school.component';
import { EditEnrollmentComponent } from './edit-enrollment/edit-enrollment.component';

@Component({
  selector: 'vex-student-enrollmentinfo',
  templateUrl: './student-enrollmentinfo.component.html',
  styleUrls: ['./student-enrollmentinfo.component.scss'],
  animations: [
    stagger60ms,
    fadeInUp400ms,
    fadeInRight400ms
  ],
})
export class StudentEnrollmentinfoComponent implements OnInit {

  icAdd = icAdd;

  //form: FormGroup;

  constructor(private fb: FormBuilder,private dialog: MatDialog) { }

  ngOnInit(): void {
    //this.form = this.fb.group({});
  }

  openEnrollToNewSchool() {
    this.dialog.open(EnrollToSchoolComponent, {
      width: '600px'
    });
  }

  openEnrollmentInfo() {
    this.dialog.open(EditEnrollmentComponent, {
      width: '600px'
    });
  }

}
