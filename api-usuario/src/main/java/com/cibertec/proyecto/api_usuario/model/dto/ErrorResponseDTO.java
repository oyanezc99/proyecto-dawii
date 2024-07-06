package com.cibertec.proyecto.api_usuario.model.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.http.HttpStatus;

import java.util.Date;

@Data
public class ErrorResponseDTO {
    @JsonFormat(shape = JsonFormat.Shape.STRING,pattern="dd-MM-yyyy hh:mm:ss")
    private Date timeStamp;
    private int code;
    private String status;
    private String message;
    private String stackTrace;

    public ErrorResponseDTO(
            HttpStatus httpStatus,
            String message,
            String stackTrace
    ){
        this.timeStamp = new Date();
        this.message = message;
        this.stackTrace = stackTrace;
        this.code = httpStatus.value();
        this.status = httpStatus.name();
    }
}
