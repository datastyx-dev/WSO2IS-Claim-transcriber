/*
 * Copyright (c) 2016, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
 *
 * WSO2 Inc. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package org.datastyx.wso2.nato.jwtissuer;

/**
 * Constants.
 */
public class Constants {
    public static final String TOKEN_EXCHANGE_GRANT_TYPE = "urn:ietf:params:oauth:grant-type:token-exchange";
    static final String ISSUED_TOKEN_TYPE = "issued_token_type";
    static final String ACCESS_TOKEN_TYPE = "urn:ietf:params:oauth:token-type:access_token";
    static final String JWT_TOKEN_TYPE = "urn:ietf:params:oauth:token-type:jwt";
    static final String SAML1_TOKEN_TYPE = "urn:ietf:params:oauth:token-type:saml1";
    static final String SAML2_TOKEN_TYPE = "urn:ietf:params:oauth:token-type:saml2";
    static final String SUBJECT_TOKEN = "subject_token";
    static final String ASSERTION_PARAM = "assertion";
    static final String SUBJECT_TOKEN_TYPE = "subject_token_type";
    static final String REQUESTED_TOKEN_TYPE = "requested_token_type";

    // public static final String ACI_CUSTOM_CLAIM_URIS_PREFIX =
    // "http://wso2.org/claims/aci";

    // public static final String ROLE_ACI_CUSTOM_CLAIM_URI =
    // "http://wso2.org/claims/aciRol";
    // public static final String ROLE_ACI_ATTRIBUTE_ID = "aciRol";

    // public static final String CITIZENSHIP_ACI_CUSTOM_CLAIM_URI =
    // "http://wso2.org/claims/aciCit";
    // public static final String CITIZENSHIP_ACI_ATTRIBUTE_ID = "aciCit";

    // public static final String SPONSOR_ACI_CUSTOM_CLAIM_URI =
    // "http://wso2.org/claims/aciSpr";
    // public static final String SPONSOR_ACI_ATTRIBUTE_ID = "aciSpr";

    // public static final String COI_ACI_CUSTOM_CLAIM_URI =
    // "http://wso2.org/claims/aciCOI";
    // public static final String COI_ACI_ATTRIBUTE_ID = "aciCOI";

    // public static final String CLEARANCE_ACI_CUSTOM_CLAIM_URI =
    // "http://wso2.org/claims/aciClr";
    // public static final String CLEARANCE_ACI_ATTRIBUTE_ID = "aciClr";
}
