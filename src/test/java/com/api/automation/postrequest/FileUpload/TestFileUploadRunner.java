package com.api.automation.postrequest.FileUpload;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestFileUploadRunner {
	
	@Test
	public Karate runTest() {
		return Karate.run("fileUpload").relativeTo(getClass());
	}
}