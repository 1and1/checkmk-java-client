package com.ionos.network.checkmk.demo;

import com.ionos.network.checkmk.openapi.ApiClient;
import com.ionos.network.checkmk.openapi.StringUtil;

public class CustomApiClient extends ApiClient {
    @Override
    public String selectHeaderAccept(String[] accepts) {
        return StringUtil.join(accepts, ",");
    }

}
