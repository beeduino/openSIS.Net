import { ChangeDetectionStrategy, ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';
import { MatSnackBar } from '@angular/material/snack-bar';
import icVisibility from '@iconify/icons-ic/twotone-visibility';
import icVisibilityOff from '@iconify/icons-ic/twotone-visibility-off';
import icLanguage from '@iconify/icons-ic/twotone-language';
import { fadeInUp400ms } from '../../../../@vex/animations/fade-in-up.animation';
import { UserViewModel } from '../../../models/userModel';
import { LoginService } from '../../../services/login.service';
import { Observable, timer } from 'rxjs';
import { map } from 'rxjs/operators';
import { TranslateService } from '@ngx-translate/core';
import { LoaderService } from '../../../services/loader.service';
import { ValidationService } from '../../shared/validation.service';
import { LanguageModel } from '../../../models/languageModel';
import { CookieService } from 'ngx-cookie-service';

@Component({
  selector: 'vex-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
  changeDetection: ChangeDetectionStrategy.OnPush,
  animations: [
    fadeInUp400ms
  ]
})
export class LoginComponent implements OnInit {

  form: FormGroup;
  private date = new Date();
  time: Observable<Date> = timer(0, 1000).pipe(map(() => new Date()));
  inputType = 'password';
  visible = false;
  icVisibility = icVisibility;
  icVisibilityOff = icVisibilityOff;
  icLanguage = icLanguage;
  public tenant = "";
  UserModel: UserViewModel = new UserViewModel();
  loading: Boolean;
  languages: LanguageModel = new LanguageModel();
  listOfLanguageCode;
  selectedLanguage;
  languageList;
  expiredDate
  setValue = false;

  constructor(
    private router: Router,
    private Activeroute: ActivatedRoute,
    private fb: FormBuilder,
    private cd: ChangeDetectorRef,
    private snackbar: MatSnackBar,
    private loginService: LoginService,
    public translate: TranslateService,
    private loaderService: LoaderService,
    private cookieService: CookieService
  ) {
    this.Activeroute.params.subscribe(params => { this.tenant = params.id || 'opensisv2'; });
    this.translate.addLangs(['en', 'fr']);
    this.translate.setDefaultLang('en');
    sessionStorage.setItem("tenant", this.tenant);
    this.loaderService.isLoading.subscribe((v) => {
      this.loading = v;
    });
    this.GetAllLanguage();
    this.form = this.fb.group({
      email: ['', [Validators.required, ValidationService.emailValidator]],
      password: ['', Validators.required]
    });
  }
  get f() { return this.form.controls; }

  ngOnInit() {
    if (this.cookieService.get('userDetails') !== null && this.cookieService.get('userDetails') !== "") {
      this.setValue = true;
      this.UserModel.email = JSON.parse(this.cookieService.get('userDetails')).email;
      this.form.patchValue({ password: JSON.parse(this.cookieService.get('userDetails')).password });
      this.form.markAsDirty();
    }

  }

  rememberMe(event) {
    if (!event) {
      this.expiredDate = new Date();
      this.expiredDate.setDate(this.expiredDate.getDate() + 7);
      this.cookieService.set('userDetails', JSON.stringify(this.form.value), this.expiredDate);

    }
    else {
      if (this.cookieService.get('userDetails') !== null && this.cookieService.get('userDetails') !== "") {

        this.cookieService.delete('userDetails');
      }
    }

  }

  send() {
    if (this.form.dirty && this.form.valid) {
      this.UserModel._tenantName = this.tenant;
      this.UserModel.password = this.form.value.password;
      this.loginService.ValidateLogin(this.UserModel).subscribe(data => {
        if (typeof (data) == 'undefined') {
          this.snackbar.open('Login failed. ' + sessionStorage.getItem("httpError"), '', {
            duration: 10000
          });
        }
        else {
          if (data._failure) {
            this.snackbar.open('Login failed. ' + data._message, 'LOL THANKS', {
              duration: 10000
            });
          } else {
            sessionStorage.setItem("token", data._token);
            sessionStorage.setItem("tenantId", data.tenantId);
            sessionStorage.setItem("email", data.email);
            this.router.navigateByUrl("/school/dashboards");
          }
        }
      })
    }
  }

  GetAllLanguage() {
    this.languages._tenantName = this.tenant;
    this.loginService.getAllLanguage(this.languages).subscribe((res) => {
      this.languageList = res.tableLanguage;
      // **Below commented lines(4) will be uncommented when we will have multilingual feature.
      //  this.listOfLanguageCode = this.languageList.map(a=>a.languageCode);
      //   this.translate.addLangs(this.listOfLanguageCode);
      //   this.translate.setDefaultLang('en');
      // this.selectedLanguage=this.translate.defaultLang
      if (this.languageList?.length > 0) {
        let modifiedLanguageList = [];
        for (let i = 0; i < this.languageList?.length; i++) {
          if (this.languageList[i].lcid == "en-us" || this.languageList[i].lcid == "fr-fr" || this.languageList[i].lcid == "es-es") {
            modifiedLanguageList.push(this.languageList[i]);
          }
          if (modifiedLanguageList.length >= 3) {
            break;
          }
        }
        this.languageList = modifiedLanguageList;
      }

      let checkPreviousPreference = sessionStorage.getItem("language");
      if (checkPreviousPreference == null) {
        sessionStorage.setItem("language", 'en-us');
        this.selectedLanguage = sessionStorage.getItem("language");
      } else {
        this.selectedLanguage = sessionStorage.getItem("language");
      }
    })
  }

  toggleVisibility() {
    if (this.visible) {
      this.inputType = 'password';
      this.visible = false;
      this.cd.markForCheck();
    } else {
      this.inputType = 'text';
      this.visible = true;
      this.cd.markForCheck();
    }
  }

  switchLang(lang: string) {
    sessionStorage.setItem("language", lang);
    this.selectedLanguage = lang;
    // this.translate.use(lang)
  }

}
