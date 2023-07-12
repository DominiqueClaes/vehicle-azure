package com.enervalis.vehicles.api;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

import java.util.List;

@Path("vehicles")
public class VehicleEndpoint {

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<VehicleDTO> getVehicles() {
        return List.of(
            new VehicleDTO("1", "Tesla Model Y", "Tesla"),
            new VehicleDTO("2", "Tesla Model 3", "Tesla"),
            new VehicleDTO("3", "Fiat 500e", "Fiat"),
            new VehicleDTO("4", "Peugeot e-208", "Peugeot"),
            new VehicleDTO("5", "Volkswagen ID.4", "Volkswagen")
        );
    }
}
