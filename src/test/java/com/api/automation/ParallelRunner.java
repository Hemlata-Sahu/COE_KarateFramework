package com.api.automation;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Runner;
import com.intuit.karate.Runner.Builder;

public class ParallelRunner {
	
	
	
	/* This is the simple tag example
	 @Test
	 public void executeKarateTests() {
		//Runner.parallel(getClass(), 5);
		Builder aRunner = new Builder();
		aRunner.path("classpath:com/api/automation");
		aRunner.parallel(5);
		//Runner.parallel(aRunner);
	}
  */ 
	
	//This one is reading tags from ReadSystemProperty file
	//Create property file
	//Set Run configuration 
	//Create get functions for reading property file value & 
	//Set debug configuration
	
	private static final String CLASS_PATH = "classpath:";
	private static final String DELIMITER = ",";
	
	@Test
	public void executeKarateTests() {
		// Runner.parallel(getClass(), 5);
		Builder aRunner = new Builder();
		aRunner.path(getLocation());
		// aRunner.tags("@Smoke","@Regression");
		aRunner.tags(getTags());
		aRunner.parallel(5);
		// Runner.parallel(aRunner);
	}
	
	/*private List<String> getTags() {
	String aTags = System.getProperty("tags", "@Confidence");
	List<String> aTagList = Arrays.asList(aTags);
	return aTagList;
}

private List<String> getLocation() {
	String aLocation = System.getProperty("location", "com/api/automation");
	List<String> aLocationList = Arrays.asList(CLASS_PATH + aLocation);
	return aLocationList;
} */

private List<String> getTags() {
	String aTags = System.getProperty("tags", "@Smoke");
	List<String> aTagList = Collections.emptyList();
	// First check for the delimiter (,)
	// if the aTags has the delimiter then split the string using the delimiter 
	// And create the list out of it
	// if aTags does not have delimiter, the use the old logic
	if(aTags.contains(DELIMITER)) {
		String tagArray[] = aTags.split(DELIMITER);
		aTagList = Arrays.asList(tagArray);
		return aTagList;
	}
	aTagList = Arrays.asList(aTags);
	return aTagList;
	
}

private List<String> getLocation() {
	String aLocation = System.getProperty("location", "com/api/automation");
	List<String> aLocationList = Collections.emptyList();
	if(aLocation.contains(DELIMITER)) {
		String locationArray[] = aLocation.split(DELIMITER);
		aLocationList = Arrays.asList(locationArray);	
		aLocationList.replaceAll((entry) -> {
			return CLASS_PATH + entry;
		});
		return aLocationList;
	}
	aLocationList = Arrays.asList(CLASS_PATH + aLocation);
	return aLocationList;
}
}
