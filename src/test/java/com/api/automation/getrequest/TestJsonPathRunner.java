package com.api.automation.getrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;
import org.junit.runner.RunWith;

public class TestJsonPathRunner {
	@Test
	public Karate runTest() {
		return Karate.run("jsonPathExpression").relativeTo(getClass());
	}

}
