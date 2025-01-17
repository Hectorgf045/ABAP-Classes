CLASS zcl_customer_manager_xxx DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    METHODS add_customer
      IMPORTING id TYPE Z_CUSTOMER_ID_XXX
                nombre TYPE Z_CUSTOMER_NAME_XXX
                activo TYPE Z_CUSTOMER_ACTIVO_XXX
      EXPORTING
                e_result TYPE SY-SUBRC.

     METHODS update_customer
      IMPORTING
        id TYPE z_customer_id_xxx
        nombre TYPE z_customer_name_xxx
        activo TYPE z_customer_activo_xxx
      EXPORTING
        e_result TYPE i.

    METHODS delete_customer
      IMPORTING
        id TYPE z_customer_id_xxx
      EXPORTING
        e_result TYPE i.
ENDCLASS.

CLASS zcl_customer_manager_xxx IMPLEMENTATION.

  METHOD add_customer.
    DATA datosEditados TYPE zstruct_customer_xxx.

    datosEditados-customer_id = id.
    datosEditados-customer_name = nombre.
    datosEditados-customer_activo = activo.

    INSERT ztcustomer_xxx FROM @datosEditados.
    e_result = sy-subrc.
  ENDMETHOD.

  METHOD update_customer.
    DATA datosEditados TYPE zstruct_customer_xxx.

    datosEditados-customer_id = id.
    datosEditados-customer_name = nombre.
    datosEditados-customer_activo = activo.

    UPDATE ztcustomer_xxx
        SET customer_name = @nombre,
            customer_activo = @activo
        Where customer_id = @id.

        e_result = sy-subrc.

  ENDMETHOD.

  METHOD delete_customer.
    DELETE FROM ztcustomer_xxx WHERE customer_id = @id.

    e_result = sy-subrc.
  ENDMETHOD.

ENDCLASS.
