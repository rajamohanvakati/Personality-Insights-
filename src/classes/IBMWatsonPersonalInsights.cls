public class IBMWatsonPersonalInsights {
    
    Private String userIds {get;set;}
    public User c{get;set;}
    public String jsonData{get;set;}
    public IBMWatsonPersonalInsights(ApexPages.StandardController con){
        userIds = con.getId() ; 
        c =[Select Id , Name from User where id=:userIds] ;
        callWatsonToneAnalyser(c);
    }
    
    public  void callWatsonToneAnalyser(User c) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Bluemix_Tone_Analyser/v3/tone?version=2016-05-18');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setBody(stringToJSON(c));
        Http http = new Http();
        HTTPResponse res = http.send(req);
        jsonData = res.getBody();
        //System.debug('==>'+res.getBody());
        // return (ToneAnalysis) JSON.deserialize(res.getBody(), ToneAnalysis.class);
    }
    
    private static String stringToJSON(User c) {
        JSONGenerator generator = JSON.createGenerator(true);
        generator.writeStartObject();
        generator.writeStringField('text', c.Name+''+c.Profile);
        generator.writeEndObject();
        return generator.getAsString();
    }
}