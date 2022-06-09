/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     17/6/2021 3:23:56                            */
/*==============================================================*/


drop table CHOFER;

drop table CONTROL_CITA;

drop table CONTROL_INSUMO;

drop table DOCTOR;

drop table ENFERMERA;

drop table PACIENTE;

drop table RELATIONSHIP_3;

drop table RELATIONSHIP_8;

drop table RELATIONSHIP_9;

drop table SALA;

drop table VIAJE;

/*==============================================================*/
/* Table: CHOFER                                                */
/*==============================================================*/
create table CHOFER (
   ID_CHOFER            INT2                 not null,
   CEDULA_CHOFER        INT4                 not null,
   NOMBRES_CHOFER       CHAR(100)            not null,
   APELLIDOS_CHOFER     CHAR(100)            not null,
   TELEFONO_CELULAR_CHOFER NUMERIC(10)          not null,
   ESTADO               BOOL                 not null,
   FECHA_INGRESO_CHOFER DATE                 not null,
   VIAJES_TOTAL         INT4                 not null,
   constraint PK_CHOFER primary key (ID_CHOFER)
);

/*==============================================================*/
/* Table: CONTROL_CITA                                          */
/*==============================================================*/
create table CONTROL_CITA (
   ID_CITAS             INT2                 not null,
   ID_PACIENTE          INT2                 null,
   ID_DOCTOR            INT2                 null,
   FECHA_CITA           DATE                 not null,
   PROX_CITA            DATE                 not null,
   DIAGNOSTICO          CHAR(100)            not null,
   EXAMENES_CITA        CHAR(100)            not null,
   constraint PK_CONTROL_CITA primary key (ID_CITAS)
);

/*==============================================================*/
/* Table: CONTROL_INSUMO                                        */
/*==============================================================*/
create table CONTROL_INSUMO (
   ID_INSUMOS           INT2                 not null,
   CODIGO               INT4                 not null,
   FECHA_ENTRADA_INSUMO DATE                 not null,
   INSUMO               VARCHAR(100)         not null,
   DESCRIPCION_INSUMO   VARCHAR(100)         not null,
   UNIDAD_TOTAL         INT4                 not null,
   VALOR_TOTAL          INT4                 not null,
   VENCIMIENTO          DATE                 not null,
   CANT_ENTRADA         INT4                 not null,
   CANT_SALIDA          INT4                 not null,
   CANT_EXISTENCIAS     INT4                 not null,
   constraint PK_CONTROL_INSUMO primary key (ID_INSUMOS)
);

/*==============================================================*/
/* Table: DOCTOR                                                */
/*==============================================================*/
create table DOCTOR (
   ID_DOCTOR            INT2                 not null,
   CEDULA_DOCTOR        INT4                 not null,
   NOMBRES_DOCTOR       CHAR(100)            not null,
   APELLIDOS_DOCTOR     CHAR(100)            not null,
   CORREO_DOCTOR        VARCHAR(100)         not null,
   TELEFONO_CELULAR_DOCTOR NUMERIC(10)          not null,
   TELEFONO_OFICINA_DOCTOR NUMERIC(10)          not null,
   DOMICILIO_DOCTOR     CHAR(100)            not null,
   TRATAMIENTO_DOCTOR   CHAR(100)            not null,
   PARTOS_REALIZADO     INT4                 not null,
   FECHA_INICIO_DOCTOR  DATE                 not null,
   constraint PK_DOCTOR primary key (ID_DOCTOR)
);

/*==============================================================*/
/* Table: ENFERMERA                                             */
/*==============================================================*/
create table ENFERMERA (
   ID_ENFERMERA         INT2                 not null,
   CEDULA_ENFERMERA     INT4                 not null,
   NOMBRES_ENFERMERA    CHAR(100)            not null,
   APELLIDOS_ENFERMERA  CHAR(100)            not null,
   CORREO_ENFERMERA     VARCHAR(100)         not null,
   TELEFONO_CELULAR_ENFERMERA NUMERIC(10)          not null,
   TELEFONO_OFICINA_ENFERMERA NUMERIC(10)          not null,
   DOMICILIO_ENFERMERA  CHAR(100)            not null,
   FECHA_INICIO_ENFERMERA DATE                 not null,
   constraint PK_ENFERMERA primary key (ID_ENFERMERA)
);

/*==============================================================*/
/* Table: PACIENTE                                              */
/*==============================================================*/
create table PACIENTE (
   ID_PACIENTE          INT2                 not null,
   CEDULA_PACIENTE      INT4                 not null,
   NOMBRES_PACIENTE     CHAR(100)            not null,
   APELLIDOS_PACIENTE   CHAR(100)            not null,
   TELEFONO_CELULAR_PACIENTE NUMERIC(10)          not null,
   TELEFONO_DOMICILIO_PACIENTE NUMERIC(10)          not null,
   DOMICILIO_PACIENTE   CHAR(100)            not null,
   CORREO_PACIENTE      VARCHAR(100)         not null,
   TIPO_SANGRE          CHAR(4)              not null,
   HABITOS              CHAR(100)            not null,
   MES_ACTUAL_EMBARAZO  DATE                 not null,
   MES_PARTO            DATE                 not null,
   constraint PK_PACIENTE primary key (ID_PACIENTE)
);

/*==============================================================*/
/* Table: RELATIONSHIP_3                                        */
/*==============================================================*/
create table RELATIONSHIP_3 (
   ID_SALA              INT2                 not null,
   ID_ENFERMERA         INT2                 not null,
   constraint PK_RELATIONSHIP_3 primary key (ID_SALA, ID_ENFERMERA)
);

/*==============================================================*/
/* Table: RELATIONSHIP_8                                        */
/*==============================================================*/
create table RELATIONSHIP_8 (
   ID_VIAJES            INT2                 not null,
   ID_ENFERMERA         INT2                 not null,
   constraint PK_RELATIONSHIP_8 primary key (ID_VIAJES, ID_ENFERMERA)
);

/*==============================================================*/
/* Table: RELATIONSHIP_9                                        */
/*==============================================================*/
create table RELATIONSHIP_9 (
   ID_INSUMOS           INT2                 not null,
   ID_SALA              INT2                 not null,
   constraint PK_RELATIONSHIP_9 primary key (ID_INSUMOS, ID_SALA)
);

/*==============================================================*/
/* Table: SALA                                                  */
/*==============================================================*/
create table SALA (
   ID_SALA              INT2                 not null,
   ID_PACIENTE          INT2                 null,
   ID_DOCTOR            INT2                 null,
   N_SALA               INT4                 not null,
   HORA_ENTRADA_SALA    TIME                 not null,
   HORA_SALIDA_SALA     TIME                 not null,
   FECHA_SALA           DATE                 not null,
   TIPO_PARTO           VARCHAR(50)          not null,
   CONDICION_NEONATO    CHAR(100)            null,
   INCUBADORA           BOOL                 null,
   constraint PK_SALA primary key (ID_SALA)
);

/*==============================================================*/
/* Table: VIAJE                                                 */
/*==============================================================*/
create table VIAJE (
   ID_VIAJES            INT2                 not null,
   ID_PACIENTE          INT2                 null,
   ID_CHOFER            INT2                 null,
   FECHA_VIAJE          DATE                 not null,
   LUGAR_PARTIDA        CHAR(100)            not null,
   LUGAR_DESTINO        CHAR(100)            not null,
   constraint PK_VIAJE primary key (ID_VIAJES)
);

alter table CONTROL_CITA
   add constraint FK_CONTROL__RELATIONS_PACIENTE foreign key (ID_PACIENTE)
      references PACIENTE (ID_PACIENTE)
      on delete restrict on update restrict;

alter table CONTROL_CITA
   add constraint FK_CONTROL__RELATIONS_DOCTOR foreign key (ID_DOCTOR)
      references DOCTOR (ID_DOCTOR)
      on delete restrict on update restrict;

alter table RELATIONSHIP_3
   add constraint FK_RELATION_RELATIONS_ENFERMER foreign key (ID_ENFERMERA)
      references ENFERMERA (ID_ENFERMERA)
      on delete restrict on update restrict;

alter table RELATIONSHIP_3
   add constraint FK_RELATION_RELATIONS_SALA foreign key (ID_SALA)
      references SALA (ID_SALA)
      on delete restrict on update restrict;

alter table RELATIONSHIP_8
   add constraint FK_RELATION_RELATIONS_ENFERMER foreign key (ID_ENFERMERA)
      references ENFERMERA (ID_ENFERMERA)
      on delete restrict on update restrict;

alter table RELATIONSHIP_8
   add constraint FK_RELATION_RELATIONS_VIAJE foreign key (ID_VIAJES)
      references VIAJE (ID_VIAJES)
      on delete restrict on update restrict;

alter table RELATIONSHIP_9
   add constraint FK_RELATION_RELATIONS_SALA foreign key (ID_SALA)
      references SALA (ID_SALA)
      on delete restrict on update restrict;

alter table RELATIONSHIP_9
   add constraint FK_RELATION_RELATIONS_CONTROL_ foreign key (ID_INSUMOS)
      references CONTROL_INSUMO (ID_INSUMOS)
      on delete restrict on update restrict;

alter table SALA
   add constraint FK_SALA_RELATIONS_PACIENTE foreign key (ID_PACIENTE)
      references PACIENTE (ID_PACIENTE)
      on delete restrict on update restrict;

alter table SALA
   add constraint FK_SALA_RELATIONS_DOCTOR foreign key (ID_DOCTOR)
      references DOCTOR (ID_DOCTOR)
      on delete restrict on update restrict;

alter table VIAJE
   add constraint FK_VIAJE_RELATIONS_PACIENTE foreign key (ID_PACIENTE)
      references PACIENTE (ID_PACIENTE)
      on delete restrict on update restrict;

alter table VIAJE
   add constraint FK_VIAJE_RELATIONS_CHOFER foreign key (ID_CHOFER)
      references CHOFER (ID_CHOFER)
      on delete restrict on update restrict;

