/* tslint:disable */
/* eslint-disable */
import { Injectable } from '@angular/core';
import { HttpClient, HttpResponse } from '@angular/common/http';
import { BaseService } from '../base-service';
import { ApiConfiguration } from '../api-configuration';
import { StrictHttpResponse } from '../strict-http-response';
import { RequestBuilder } from '../request-builder';
import { Observable } from 'rxjs';
import { map, filter } from 'rxjs/operators';

import { ExampleResponse } from '../models/example-response';

@Injectable({
  providedIn: 'root',
})
export class ExampleControllerService extends BaseService {
  constructor(
    config: ApiConfiguration,
    http: HttpClient
  ) {
    super(config, http);
  }

  /**
   * Path part for operation getList
   */
  static readonly GetListPath = '/list';

  /**
   * This method provides access to the full `HttpResponse`, allowing access to response headers.
   * To access only the response body, use `getList()` instead.
   *
   * This method doesn't expect any request body.
   */
  getList$Response(params?: {
  }): Observable<StrictHttpResponse<Array<ExampleResponse>>> {

    const rb = new RequestBuilder(this.rootUrl, ExampleControllerService.GetListPath, 'get');
    if (params) {
    }

    return this.http.request(rb.build({
      responseType: 'json',
      accept: 'application/json'
    })).pipe(
      filter((r: any) => r instanceof HttpResponse),
      map((r: HttpResponse<any>) => {
        return r as StrictHttpResponse<Array<ExampleResponse>>;
      })
    );
  }

  /**
   * This method provides access to only to the response body.
   * To access the full response (for headers, for example), `getList$Response()` instead.
   *
   * This method doesn't expect any request body.
   */
  getList(params?: {
  }): Observable<Array<ExampleResponse>> {

    return this.getList$Response(params).pipe(
      map((r: StrictHttpResponse<Array<ExampleResponse>>) => r.body as Array<ExampleResponse>)
    );
  }

}
