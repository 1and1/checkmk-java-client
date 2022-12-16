package com.ionos.network.checkmk.demo;

import com.ionos.network.checkmk.openapi.ApiClient;
import com.ionos.network.checkmk.openapi.StringUtil;

/** Since the generated client will only send the accept header for
 * JSON, Checkmk will refuse this.
 * This class will make the client accept all acceptable types for the
 * API endpoint.
 * */
public class CustomApiClient extends ApiClient {
    @Override
    public String selectHeaderAccept(String[] accepts) {
        return StringUtil.join(accepts, ",");
    }

}
