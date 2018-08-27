package api;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Collections;
import org.apache.tomcat.util.security.MD5Encoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.MessageDigestPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import services.UserService;

import javax.xml.bind.DatatypeConverter;

public class CustomAuthenticator implements AuthenticationProvider {
    private static final String DISABLED_MESSAGE = "La cuenta se encuentra deshabilitada";
    private static final String FORGOT_MESSAGE = "Ha olvidado su clave";
    private static final String NOT_EXISTS_MESSAGE = "El usuario ingresado no existe en nuestras bases";

    @Autowired
    private UserService userService;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String username = authentication.getName();
        String inputPassword = null;
        
        UserDetails userDetails = userService.getUserDetailByUsername(username);
        
        if (authentication.getCredentials() != null) {
            inputPassword = authentication.getCredentials().toString();
        }
        
        if (userDetails == null) {
            throw new UsernameNotFoundException(NOT_EXISTS_MESSAGE);
        }

        if (!Boolean.TRUE.equals(userDetails.isEnabled())) {
            throw new DisabledException(DISABLED_MESSAGE);
        }
        
        if (!Boolean.TRUE.equals(passwordMatches(inputPassword, userDetails.getPassword()))) {
            throw new BadCredentialsException(FORGOT_MESSAGE);
        }


        return new UsernamePasswordAuthenticationToken(username, inputPassword, Collections.emptyList());
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
    }

    private boolean passwordMatches(String inputPass, String realPass) {
        MessageDigest md;
        try {
            md = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException e) {
            return false;
        }
        md.update(inputPass.getBytes());
        byte[] digest = md.digest();
        String hash = DatatypeConverter.printHexBinary(digest);
        return hash.equalsIgnoreCase(realPass);
    }
}
