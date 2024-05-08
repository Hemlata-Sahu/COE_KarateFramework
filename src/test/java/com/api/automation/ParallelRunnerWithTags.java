package com.api.automation;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Runner;
import com.intuit.karate.Runner.Builder;
public class ParallelRunnerWithTags {
	private static final String CLASS_PATH = "classpath:";
	private static final String DELIMITER = ",";

	@Test
	public void executeKarateTests() {
		
		Builder aRunner = new Builder();
		aRunner.path("classpath:com/api/automation");
		aRunner.tags("@Smoke","@Regression");
		aRunner.parallel(5);
	  //  Runner.parallel(aRunner);
	}
	
}
	