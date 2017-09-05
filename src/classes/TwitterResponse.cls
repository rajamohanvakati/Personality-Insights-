public class TwitterResponse {
	public static void consumeObject(JSONParser parser) {
		Integer depth = 0;
		do {
			JSONToken curr = parser.getCurrentToken();
			if (curr == JSONToken.START_OBJECT || 
				curr == JSONToken.START_ARRAY) {
				depth++;
			} else if (curr == JSONToken.END_OBJECT ||
				curr == JSONToken.END_ARRAY) {
				depth--;
			}
		} while (depth > 0 && parser.nextToken() != null);
	}

	public class Description {
		public List<Hashtags> urls {get;set;} 

		public Description(JSONParser parser) {
			while (parser.nextToken() != JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != JSONToken.VALUE_NULL) {
						if (text == 'urls') {
							urls = new List<Hashtags>();
							while (parser.nextToken() != JSONToken.END_ARRAY) {
								urls.add(new Hashtags(parser));
							}
						} else {
							System.debug(LoggingLevel.WARN, 'Description consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class User {
		public String profile_sidebar_fill_color {get;set;} 
		public String profile_sidebar_border_color {get;set;} 
		public Boolean profile_background_tile {get;set;} 
		public String name {get;set;} 
		public String profile_image_url {get;set;} 
		public String created_at {get;set;} 
		public String location {get;set;} 
		public Boolean follow_request_sent {get;set;} 
		public String profile_link_color {get;set;} 
		public Boolean is_translator {get;set;} 
		public String id_str {get;set;} 
		public Entities_Z entities {get;set;} 
		public Boolean default_profile {get;set;} 
		public Boolean contributors_enabled {get;set;} 
		public Integer favourites_count {get;set;} 
		public String url {get;set;} 
		public String profile_image_url_https {get;set;} 
		public Integer utc_offset {get;set;} 
		public Integer id {get;set;} 
		public Boolean profile_use_background_image {get;set;} 
		public Integer listed_count {get;set;} 
		public String profile_text_color {get;set;} 
		public String lang {get;set;} 
		public Integer followers_count {get;set;} 
		public Boolean protected_Z {get;set;} // in json: protected
		//public Object notifications {get;set;} 
		public String profile_background_image_url_https {get;set;} 
		public String profile_background_color {get;set;} 
		public Boolean verified {get;set;} 
		public Boolean geo_enabled {get;set;} 
		public String time_zone {get;set;} 
		public String description {get;set;} 
		public Boolean default_profile_image {get;set;} 
		public String profile_background_image_url {get;set;} 
		public Integer statuses_count {get;set;} 
		public Integer friends_count {get;set;} 
		//public Object following {get;set;} 
		public Boolean show_all_inline_media {get;set;} 
		public String screen_name {get;set;} 

		public User(JSONParser parser) {
			while (parser.nextToken() != JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != JSONToken.VALUE_NULL) {
						if (text == 'profile_sidebar_fill_color') {
							profile_sidebar_fill_color = parser.getText();
						} else if (text == 'profile_sidebar_border_color') {
							profile_sidebar_border_color = parser.getText();
						} else if (text == 'profile_background_tile') {
							profile_background_tile = parser.getBooleanValue();
						} else if (text == 'name') {
							name = parser.getText();
						} else if (text == 'profile_image_url') {
							profile_image_url = parser.getText();
						} else if (text == 'created_at') {
							created_at = parser.getText();
						} else if (text == 'location') {
							location = parser.getText();
						} else if (text == 'follow_request_sent') {
							follow_request_sent = parser.getBooleanValue();
						} else if (text == 'profile_link_color') {
							profile_link_color = parser.getText();
						} else if (text == 'is_translator') {
							is_translator = parser.getBooleanValue();
						} else if (text == 'id_str') {
							id_str = parser.getText();
						} else if (text == 'entities') {
							entities = new Entities_Z(parser);
						} else if (text == 'default_profile') {
							default_profile = parser.getBooleanValue();
						} else if (text == 'contributors_enabled') {
							contributors_enabled = parser.getBooleanValue();
						} else if (text == 'favourites_count') {
							favourites_count = parser.getIntegerValue();
						} else if (text == 'url') {
							url = parser.getText();
						} else if (text == 'profile_image_url_https') {
							profile_image_url_https = parser.getText();
						} else if (text == 'utc_offset') {
							utc_offset = parser.getIntegerValue();
						} else if (text == 'id') {
							id = parser.getIntegerValue();
						} else if (text == 'profile_use_background_image') {
							profile_use_background_image = parser.getBooleanValue();
						} else if (text == 'listed_count') {
							listed_count = parser.getIntegerValue();
						} else if (text == 'profile_text_color') {
							profile_text_color = parser.getText();
						} else if (text == 'lang') {
							lang = parser.getText();
						} else if (text == 'followers_count') {
							followers_count = parser.getIntegerValue();
						} else if (text == 'protected') {
							protected_Z = parser.getBooleanValue();
						} else if (text == 'notifications') {
							//notifications = new Object(parser);
						} else if (text == 'profile_background_image_url_https') {
							profile_background_image_url_https = parser.getText();
						} else if (text == 'profile_background_color') {
							profile_background_color = parser.getText();
						} else if (text == 'verified') {
							verified = parser.getBooleanValue();
						} else if (text == 'geo_enabled') {
							geo_enabled = parser.getBooleanValue();
						} else if (text == 'time_zone') {
							time_zone = parser.getText();
						} else if (text == 'description') {
							description = parser.getText();
						} else if (text == 'default_profile_image') {
							default_profile_image = parser.getBooleanValue();
						} else if (text == 'profile_background_image_url') {
							profile_background_image_url = parser.getText();
						} else if (text == 'statuses_count') {
							statuses_count = parser.getIntegerValue();
						} else if (text == 'friends_count') {
							friends_count = parser.getIntegerValue();
						} else if (text == 'following') {
							//following = new Object(parser);
						} else if (text == 'show_all_inline_media') {
							show_all_inline_media = parser.getBooleanValue();
						} else if (text == 'screen_name') {
							screen_name = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'User consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	//public Object coordinates {get;set;} 
	public Boolean favorited {get;set;} 
	public Boolean truncated {get;set;} 
	public String created_at {get;set;} 
	public String id_str {get;set;} 
	public Entities entities {get;set;} 
	//public Object in_reply_to_user_id_str {get;set;} 
	//public Object contributors {get;set;} 
	public String text {get;set;} 
	public Integer retweet_count {get;set;} 
	//public Object in_reply_to_status_id_str {get;set;} 
	public Long id {get;set;} 
	//public Object geo {get;set;} 
	public Boolean retweeted {get;set;} 
	public Boolean possibly_sensitive {get;set;} 
	//public Object in_reply_to_user_id {get;set;} 
	//public Object place {get;set;} 
	//public User user {get;set;} 
	//public Object in_reply_to_screen_name {get;set;} 
	public String source {get;set;} 
	//public Object in_reply_to_status_id {get;set;} 

	public TwitterResponse(JSONParser parser) {
		while (parser.nextToken() != JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != JSONToken.VALUE_NULL) {
					if (text == 'coordinates') {
						//coordinates = new Object(parser);
					} else if (text == 'favorited') {
						favorited = parser.getBooleanValue();
					} else if (text == 'truncated') {
						truncated = parser.getBooleanValue();
					} else if (text == 'created_at') {
						created_at = parser.getText();
					} else if (text == 'id_str') {
						id_str = parser.getText();
					} else if (text == 'entities') {
						entities = new Entities(parser);
					} else if (text == 'in_reply_to_user_id_str') {
						//in_reply_to_user_id_str = new Object(parser);
					} else if (text == 'contributors') {
						//contributors = new Object(parser);
					} else if (text == 'text') {
						text = parser.getText();
					} else if (text == 'retweet_count') {
						retweet_count = parser.getIntegerValue();
					} else if (text == 'in_reply_to_status_id_str') {
						//in_reply_to_status_id_str = new Object(parser);
					} else if (text == 'id') {
						id = parser.getLongValue();
					} else if (text == 'geo') {
						//geo = new Object(parser);
					} else if (text == 'retweeted') {
						retweeted = parser.getBooleanValue();
					} else if (text == 'possibly_sensitive') {
						possibly_sensitive = parser.getBooleanValue();
					} else if (text == 'in_reply_to_user_id') {
						//in_reply_to_user_id = new Object(parser);
					} else if (text == 'place') {
						//place = new Object(parser);
					} else if (text == 'user') {
						//user = new User(parser);
					} else if (text == 'in_reply_to_screen_name') {
						//in_reply_to_screen_name = new Object(parser);
					} else if (text == 'source') {
						source = parser.getText();
					} else if (text == 'in_reply_to_status_id') {
						//in_reply_to_status_id = new Object(parser);
					} else {
						System.debug(LoggingLevel.WARN, 'Root consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}
	
	public class Hashtags {

		public Hashtags(JSONParser parser) {
			while (parser.nextToken() != JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != JSONToken.VALUE_NULL) {
						{
							System.debug(LoggingLevel.WARN, 'Hashtags consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Urls_Z {
		public Object expanded_url {get;set;} 
		public String url {get;set;} 
		public List<Integer> indices {get;set;} 

		public Urls_Z(JSONParser parser) {
			while (parser.nextToken() != JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != JSONToken.VALUE_NULL) {
						if (text == 'expanded_url') {
							//expanded_url = new Object(parser);
						} else if (text == 'url') {
							url = parser.getText();
						} else if (text == 'indices') {
							indices = new List<Integer>();
							while (parser.nextToken() != JSONToken.END_ARRAY) {
								//indices.add(new Integer(parser));
							}
						} else {
							System.debug(LoggingLevel.WARN, 'Urls_Z consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Urls {
		public String expanded_url {get;set;} 
		public String url {get;set;} 
		public List<Integer> indices {get;set;} 
		public String display_url {get;set;} 

		public Urls(JSONParser parser) {
			while (parser.nextToken() != JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != JSONToken.VALUE_NULL) {
						if (text == 'expanded_url') {
							expanded_url = parser.getText();
						} else if (text == 'url') {
							url = parser.getText();
						} else if (text == 'indices') {
							indices = new List<Integer>();
							while (parser.nextToken() != JSONToken.END_ARRAY) {
								//indices.add(new Integer(parser));
							}
						} else if (text == 'display_url') {
							display_url = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Urls consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Url {
		public List<Urls_Z> urls {get;set;} 

		public Url(JSONParser parser) {
			while (parser.nextToken() != JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != JSONToken.VALUE_NULL) {
						if (text == 'urls') {
							urls = new List<Urls_Z>();
							while (parser.nextToken() != JSONToken.END_ARRAY) {
								urls.add(new Urls_Z(parser));
							}
						} else {
							System.debug(LoggingLevel.WARN, 'Url consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Entities {
		public List<Urls> urls {get;set;} 
		public List<Hashtags> hashtags {get;set;} 
		public List<Hashtags> user_mentions {get;set;} 

		public Entities(JSONParser parser) {
			while (parser.nextToken() != JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != JSONToken.VALUE_NULL) {
						if (text == 'urls') {
							urls = new List<Urls>();
							while (parser.nextToken() != JSONToken.END_ARRAY) {
								urls.add(new Urls(parser));
							}
						} else if (text == 'hashtags') {
							hashtags = new List<Hashtags>();
							while (parser.nextToken() != JSONToken.END_ARRAY) {
								hashtags.add(new Hashtags(parser));
							}
						} else if (text == 'user_mentions') {
							user_mentions = new List<Hashtags>();
							while (parser.nextToken() != JSONToken.END_ARRAY) {
								user_mentions.add(new Hashtags(parser));
							}
						} else {
							System.debug(LoggingLevel.WARN, 'Entities consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Entities_Z {
		public Url url {get;set;} 
		public Description description {get;set;} 

		public Entities_Z(JSONParser parser) {
			while (parser.nextToken() != JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != JSONToken.VALUE_NULL) {
						if (text == 'url') {
							url = new Url(parser);
						} else if (text == 'description') {
							description = new Description(parser);
						} else {
							System.debug(LoggingLevel.WARN, 'Entities_Z consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	
	public static TwitterResponse parse(String json) {
		return new TwitterResponse(System.JSON.createParser(json));
	}
}