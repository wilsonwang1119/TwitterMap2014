package twitterMap;

import com.amazonaws.ClientConfiguration;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSCredentialsProviderChain;
import com.amazonaws.auth.ClasspathPropertiesFileCredentialsProvider;
import com.amazonaws.auth.InstanceProfileCredentialsProvider;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.elasticbeanstalk.AWSElasticBeanstalkClient;

public class ElasticBcreation {
	private AWSElasticBeanstalkClient ebclient;
	public ElasticBcreation(){
	AWSCredentials credentials = null;	
	
	 ebclient = new AWSElasticBeanstalkClient(new AWSCredentialsProviderChain(
	            new InstanceProfileCredentialsProvider(),
	            new ClasspathPropertiesFileCredentialsProvider()));
	    ebclient.setRegion(Region.getRegion(Regions.US_EAST_1)); 
	    ClientConfiguration ccf=new ClientConfiguration();
	    
	    		}
}
