package com.ionos.network.checkmk.demo;

import com.ionos.network.checkmk.openapi.ApiCallback;
import com.ionos.network.checkmk.openapi.ApiClient;
import com.ionos.network.checkmk.openapi.ApiException;
import com.ionos.network.checkmk.openapi.api.MiscellaneousApi;
import com.ionos.network.checkmk.openapi.model.InstalledVersions;

/**
 * Will output something like
 * <code>
 * versions: {apache=[2.0, 4.0, 38.0], checkmk=2.1.0p17.cee, python=3.9.10 (main, Jul  6 2022, 22:25:16)
 * [GCC 11.2.0], mod_wsgi=[4.0, 9.0, 0.0], wsgi=[1.0, 0.0]}
 * edition:  cee
 * site:     nw_master
 * </code>
 *
 * You need to replace the strings:
 * <ul>
 *     <li> YOURHOST     - the FQDN of the host Checkmk runs on
 *     <li> YOURSITE     - the Checkmk site you want to query
 *     <li> YOURUSER     - the Checkmk user to authenticate with
 *     <li> YOURPASSWORD - the Checkkmk password to authenticate with
 * </ul>
 */
public class Main {
    public static void main(String[] args) throws ApiException {
        ApiClient apiClient = new CustomApiClient();
        apiClient.setBasePath("https://YOURHOST/YOURSITE/check_mk/api/1.0");
        apiClient.addDefaultHeader("Authorization", "Bearer YOURUSER YOURPASSWORD");
        MiscellaneousApi miscellaneousApi = new MiscellaneousApi(apiClient);
        InstalledVersions installedVersions = miscellaneousApi.cmkGuiPluginsOpenapiEndpointsVersionSearch();

        System.out.printf("versions: %s%n", installedVersions.getVersions());
        System.out.printf("edition:  %s%n", installedVersions.getEdition());
        System.out.printf("site:     %s%n", installedVersions.getSite());
    }
}
