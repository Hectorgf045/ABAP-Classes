CLASS zcl_main_xxx DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_main_xxx IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: lo_customer_manager TYPE REF TO zcl_customer_manager_xxx,
          lv_check_code       TYPE i,
          lt_customers        TYPE TABLE OF ztcustomer_xxx,
          ls_customer         TYPE ztcustomer_xxx,
          lv_output           TYPE string.

    CREATE OBJECT lo_customer_manager.

    lv_output = 'Insertando en tabla'.
    out->write( lv_output ).

    lo_customer_manager->add_customer( EXPORTING id = '5'
                                                 nombre = 'Héctor'
                                                 activo = 'X'
                                       IMPORTING e_result = lv_check_code ).
    IF lv_check_code = 0.
      lv_output = 'Registro 1 insertado correctamente.'.
    ELSE.
      lv_output = 'No se pudo insertar a Héctor.'.
    ENDIF.
    out->write( lv_output ).

    lo_customer_manager->add_customer( EXPORTING id = '6'
                                                 nombre = 'Rubén'
                                                 activo = 'X'
                                       IMPORTING e_result = lv_check_code ).

    IF lv_check_code = 0.
      lv_output = 'Registro 2 insertado correctamente.'.
    ELSE.
      lv_output = 'Error al insertar Rubén.'.
    ENDIF.
    out->write( lv_output ).

    lo_customer_manager->add_customer( EXPORTING id = '7'
                                                 nombre = 'Jorge'
                                                 activo = 'X'
                                       IMPORTING e_result = lv_check_code ).
    IF lv_check_code = 0.
      lv_output = 'Registro 3 insertado correctamente.'.
    ELSE.
      lv_output = 'Error al insertar Jorge.'.
    ENDIF.
    out->write( lv_output ).

    lo_customer_manager->add_customer( EXPORTING id = '8'
                                                 nombre = 'Daniel'
                                                 activo = ' '
                                       IMPORTING e_result = lv_check_code ).
    IF lv_check_code = 0.
      lv_output = 'Registro 4 insertado correctamente.'.
    ELSE.
      lv_output = 'Error al insertar Daniel.'.
    ENDIF.
    out->write( lv_output ).

    lv_output = 'Actualizando registros'.
    out->write( lv_output ).

    lo_customer_manager->update_customer( EXPORTING id = '6'
                                                    nombre = 'Luigi'
                                                    activo = 'X'
                                           IMPORTING e_result = lv_check_code ).
    IF lv_check_code = 0.
      lv_output = 'Registro 2 actualizado correctamente.'.
    ELSE.
      lv_output = 'Error al actualizar Luigi.'.
    ENDIF.
    out->write( lv_output ).

    lo_customer_manager->update_customer( EXPORTING id = '7'
                                                    nombre = 'Manuel'
                                                    activo = ' '
                                          IMPORTING e_result = lv_check_code ).
    IF lv_check_code = 0.
      lv_output = 'Registro 3 actualizado correctamente.'.
    ELSE.
      lv_output = 'Error al actualizar Manuel.'.
    ENDIF.
    out->write( lv_output ).

    lv_output = 'Eliminando registros'.
    out->write( lv_output ).

    lo_customer_manager->delete_customer( EXPORTING id = '8'
                                          IMPORTING e_result = lv_check_code ).
    IF lv_check_code = 0.
      lv_output = 'Registro 4 eliminado correctamente.'.
    ELSE.
      lv_output = 'Error al eliminar CUST004.'.
    ENDIF.
    out->write( lv_output ).

    lv_output = 'Consultando registros'.
    out->write( lv_output ).

    SELECT * FROM ztcustomer_xxx INTO TABLE @lt_customers.

    LOOP AT lt_customers INTO ls_customer.
      lv_output = |ID: { ls_customer-customer_id }, Nombre: { ls_customer-customer_name }, Activo: { ls_customer-customer_activo }|.
      out->write( lv_output ).
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
