package com.api.automation;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.*;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;


public class ParallelBuilderWithCucumberReport {
	
	@Test
	public void executeKarateTest() {
		Builder aRunner = new Builder();
		//aRunner.path("classpath:com/api/automation/getrequest");
		aRunner.path("classpath:com/api/automation");
		// aRunner.parallel(5);
		Results result = aRunner.parallel(5);
		System.out.println("Total Feature => " + result.getFeaturesTotal());
		System.out.println("Total Scenarios => " + result.getScenariosTotal());
		System.out.println("Passed Scenarios => " + result.getScenariosPassed());
		//reportDirLocation --> C:/Users/hemlata.sahu/eclipse-workspace/karateframework/target/karate-reports
		generateCucumberReport(result.getReportDir());
		Assertions.assertEquals(0, result.getFailCount(), "There are Some Failed Scenarios ");
		
	}
	
	// reportDirLocation --> C:/Users/hemlata.sahu/eclipse-workspace/karateframework/target/karate-reports
	private void generateCucumberReport(String reportDirLocation) {
		File reportDir = new File(reportDirLocation);
		if (!reportDir.exists() || !reportDir.isDirectory()) {
	        System.out.println("Report directory does not exist or is not a directory: " + reportDirLocation);
	        return;
	    }

	    System.out.println("Report directory location: " + reportDirLocation);
		Collection<File> jsonCollection = FileUtils.listFiles(reportDir, new String[] {"json"}, true);
		if (jsonCollection.isEmpty()) {
	        System.out.println("No JSON report files found in the report directory.");
	        return;
	    }
				
		List<String> jsonFiles = new ArrayList<String>();
		jsonCollection.forEach(file -> jsonFiles.add(file.getAbsolutePath()));
		System.out.println("Found JSON report files:");
	    jsonFiles.forEach(System.out::println);
		
		Configuration configuration = new Configuration(reportDir, "Karate Run");
		ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, configuration);
		reportBuilder.generateReports();
	}

}
