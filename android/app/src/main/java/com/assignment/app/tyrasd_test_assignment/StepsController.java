package com.assignment.app.tyrasd_test_assignment;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.util.ArrayList;
import java.util.List;

public class StepsController {
    public String getSteps() {
        GsonBuilder builder = new GsonBuilder();
        Gson gson = builder.create();

        List<Steps> steps = new ArrayList();

        steps.add(new Steps("Select campaign settings", null, "For each ad campaign that you create, you can control how much you're willing to spend on clicks and conversations, which networks and geographical locations you want your ads to show on, and more."));
        steps.add(new Steps("Create an ad group", null, "This is step two, press continue to move forward"));
        steps.add(new Steps("Create an ad", "Last step", "Try out different ad text to see what brings in the most customers, and learn how to enhance your ads using features like ad extensions. If you run into any problems with your ads, find out how to tell if they're running and how to resolve approval issues."));

        return gson.toJson(steps);
    }

}
