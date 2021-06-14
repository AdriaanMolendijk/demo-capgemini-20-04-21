import { Component, OnInit } from '@angular/core';
import {ExampleControllerService} from '../core/api/services/example-controller.service';
import {Observable} from 'rxjs';
import {ExampleResponse} from '../core/api/models/example-response';

@Component({
  selector: 'app-main-page',
  templateUrl: './main-page.component.html',
  styleUrls: ['./main-page.component.scss']
})
export class MainPageComponent implements OnInit {
  public list$: Observable<Array<ExampleResponse>>;

  constructor(private exampleControllerService: ExampleControllerService) {
    this.list$ = this.exampleControllerService.getList();
  }

  ngOnInit(): void {

  }

}
