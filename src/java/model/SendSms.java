/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author umesh
 */
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

import java.net.URISyntaxException;

public class SendSms {

    // Find your Account Sid and Auth Token at twilio.com/console
    public static final String ACCOUNT_SID = "AC1217a46d82693cd118fe658a4b205850";
    public static final String AUTH_TOKEN = "d16063bb0ef01d3bd0d7e64d55ab4b95";

    public void sendOtp(String msg,String ToNumber) {
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        Message message = Message
                .creator(new PhoneNumber("+91"+ToNumber), // to
                        new PhoneNumber("+15672120249 "), // from
                        msg).create();
    }
    
}
