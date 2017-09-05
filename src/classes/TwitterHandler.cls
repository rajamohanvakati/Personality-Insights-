public class TwitterHandler {
    
    public static List<TwitterResponse> getTwitterDetails(String twitterHandler){
        String oauthVersion = '1.0';
        String oauthConsumerKey = 'dEa7ZayYR6gnvdnMMMDHhSXwX';        
        String oauthConsumerSecret = '0lQeueBZgmQ1cGIQIwEgaOveEN3JYEsNDRr9gWeVo1Cmovme9Z';
        String baseUrl = 'https://api.twitter.com';
        String oauthSignatureMethod = 'HMAC-SHA1';
        String strTwitterId = twitterHandler;
        String pictureURL = '';
        String twitterAcct = twitterHandler;
        String keyencoded = EncodingUtil.urlEncode(oauthConsumerKey, 'UTF-8');
        String secretkeyencoded = EncodingUtil.urlEncode(oauthConsumerSecret, 'UTF-8');
        //Create Final Key String
        String sFinal = keyencoded + ':' + secretkeyencoded;
        //Convert to Blob
        Blob headerValue = Blob.valueOf(sFinal);
        //Build Request
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api.twitter.com/oauth2/token');
        req.setMethod('POST');
        //Add Auth Header
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        req.setBody('grant_type=client_credentials');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        String responseBody = res.getBody();
        String stoken;
        JSONParser parser = JSON.createParser(res.getBody());
        while (parser.nextToken() != null) 
        {
            if (parser.getCurrentToken() == JSONToken.FIELD_NAME && parser.getText() == 'access_token')
            {
                parser.nextToken();
                stoken = parser.getText();
            }
        }
        HttpRequest req2 = new HttpRequest();
        String endpoint90 = 'https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name='+ twitterAcct + '&count=240' ;
        req2.setEndpoint(endpoint90);
        req2.setMethod('GET');
        String authorizationHeader2 = 'Bearer ' + stoken;
        req2.setHeader('Authorization', authorizationHeader2);
        Http http2 = new Http();
        HTTPResponse res2 = http2.send(req2);
        String sBody2 = res2.getBody();
        String responseBody2 = res2.getBody();
        JSONParser parser2 = JSON.createParser(res2.getBody());
        System.JSONToken token;
        List<TwitterResponse> twitterResponse = (List<TwitterResponse>)JSON.deserialize( res2.getBody() , List<TwitterResponse>.class);
        return twitterResponse ;
    }
    
}