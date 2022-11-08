package pl.piomin.services.gateway.Rest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CustomController {

    @GetMapping(value = "/custom")
    public String custom() {
        return "custom";
    }
}