package com.cibertec.proyecto.api_usuario.exception;
import com.cibertec.proyecto.api_usuario.model.dto.ErrorResponseDTO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class GlobalExceptionHandler {
    public ResponseEntity<ErrorResponseDTO> handleEntityNotFound(EntityNotFoundException ex){
        var httStatus = HttpStatus.NOT_FOUND;
        var errorResponse = new ErrorResponseDTO(
                httStatus,
                ex.getMessage(),
                ex.getStackTrace().toString()
        );
        return new ResponseEntity<>(errorResponse, httStatus);
    }
}
