package com.koreait.socket;

import com.google.auth.oauth2.GoogleCredentials;
import org.springframework.core.io.ClassPathResource;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


public class FirebaseCloudMessageService {
    private String getAccesToken() throws IOException {
        String firebaseConfigPath="firebase/firebase_service_key.json";
        GoogleCredentials googleCredentials= GoogleCredentials.fromStream(new ClassPathResource(firebaseConfigPath).getInputStream())
                .createScoped("https://wwww.googleapis.com/auth/cloud-platform");

        googleCredentials.refreshIfExpired();
        return googleCredentials.getAccessToken().getTokenValue();
    }
}
