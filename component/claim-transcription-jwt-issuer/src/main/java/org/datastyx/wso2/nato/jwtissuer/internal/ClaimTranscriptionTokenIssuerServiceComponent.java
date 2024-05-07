
package org.datastyx.wso2.nato.jwtissuer.internal;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.osgi.service.component.ComponentContext;
import org.osgi.service.component.annotations.Component;

@Component(name = "identity.oauth2.jst.claim.transcription.component.", immediate = true)
public class ClaimTranscriptionTokenIssuerServiceComponent {

    private static final Log log = LogFactory.getLog(ClaimTranscriptionTokenIssuerServiceComponent.class);

    protected void activate(ComponentContext ctxt) {

        log.info("Custom JWT Claim Transcription handler is activated");
    }

    protected void deactivate(ComponentContext ctxt) {

        log.debug("Custom JWT Claim Transcription handler is deactivated");
    }

}
