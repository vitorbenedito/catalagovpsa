package br.com.catalagovpsa.oauth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.client.resource.OAuth2ProtectedResourceDetails;
import org.springframework.security.oauth2.client.token.ClientTokenServices;
import org.springframework.security.oauth2.common.OAuth2AccessToken;

public class MongoTokenServices implements ClientTokenServices {

	@Autowired
	private MongoOperations operations;

	public OAuth2AccessToken getAccessToken(OAuth2ProtectedResourceDetails resource, Authentication authentication) {
		return null;
	}

	public void saveAccessToken(OAuth2ProtectedResourceDetails resource, Authentication authentication, OAuth2AccessToken accessToken) {
	}

	public void removeAccessToken(OAuth2ProtectedResourceDetails resource, Authentication authentication) {
	}

}