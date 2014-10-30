package twitterMap;

	import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

	import com.amazonaws.AmazonClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSCredentialsProviderChain;
import com.amazonaws.auth.ClasspathPropertiesFileCredentialsProvider;
import com.amazonaws.auth.InstanceProfileCredentialsProvider;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDBClient;
import com.amazonaws.services.dynamodbv2.model.AttributeValue;
import com.amazonaws.services.dynamodbv2.model.GetItemRequest;
import com.amazonaws.services.dynamodbv2.model.GetItemResult;
import com.amazonaws.services.dynamodbv2.model.ScanRequest;
import com.amazonaws.services.dynamodbv2.model.ScanResult;


	public class Twittergetter {
		private String keywords;		
		private AmazonDynamoDBClient dbclient;
		public Twittergetter(){
			AWSCredentials credentials = null;	
		
		 dbclient = new AmazonDynamoDBClient(new AWSCredentialsProviderChain(
		            new InstanceProfileCredentialsProvider(),
		            new ClasspathPropertiesFileCredentialsProvider()));
		    dbclient.setRegion(Region.getRegion(Regions.US_EAST_1)); 
		    		}
		
		public void setkeywords(String str){
			keywords=str;
		}
		
		 public static void main(String args[]){
			 Set<Map<String, AttributeValue>> haha = new HashSet<Map<String, AttributeValue>>();
			 Twittergetter anything=new Twittergetter();
			 haha=anything.getitem("lol");
			System.out.println(haha);
		 }
		 public Set<Map<String, AttributeValue>> getitem(String keyword) {
			 Set<Map<String, AttributeValue>> setofitem = new HashSet<Map<String, AttributeValue>>();
			 ScanRequest scanRequest = new ScanRequest()
			    .withTableName("twittermap");
			ScanResult result = dbclient.scan(scanRequest);
			for (Map<String, AttributeValue> item : result.getItems()){
				//printItem(item,keyword);
				if(item.values().toString().contains(keyword)){					
					setofitem.add(item);				
				}				
			}
			return setofitem;	 
		   }
		 
		 private void printItem(Map<String, AttributeValue> attributeList,String keyword) {
		        for (Map.Entry<String, AttributeValue> item : attributeList.entrySet()) {
		            String attributeName = item.getKey();
		            AttributeValue value = item.getValue(); 
		            if(value.toString().contains(keyword)){
		            System.out.println(attributeName + " "
		                    + (value.getS() == null ? "" : "S=[" + value.getS() + "]")
		                    );
		            }
		        }
		    }
	}

