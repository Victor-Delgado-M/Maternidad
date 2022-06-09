/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     9/6/2022 1:24:05                             */
/*==============================================================*/


drop index CHOFER_PK;

drop table CHOFER;

drop index RELATIONSHIP_7_FK;

drop index RELATIONSHIP_6_FK;

drop index CONTROL_CITA_PK;

drop table CONTROL_CITA;

drop index CONTROL_INSUMO_PK;

drop table CONTROL_INSUMO;

drop index DOCTOR_PK;

drop table DOCTOR;

drop index PACIENTE_PK;

drop table PACIENTE;

drop index PERSONAL_PK;

drop table PERSONAL;

drop index RELATIONSHIP_10_FK;

drop index RELATIONSHIP_12_FK;

drop index RELATIONSHIP_10_PK;

drop table RELATIONSHIP_10;

drop index RELATIONSHIP_8_FK;

drop index RELATIONSHIP_11_FK;

drop index RELATIONSHIP_8_PK;

drop table RELATIONSHIP_8;

drop index RELATIONSHIP_9_FK;

drop index RELATIONSHIP_2_FK;

drop index RELATIONSHIP_1_FK;

drop index SALA_PK;

drop table SALA;

drop index RELATIONSHIP_5_FK;

drop index RELATIONSHIP_4_FK;

drop index VIAJE_MATERNIDAD_PK;

drop table VIAJE_MATERNIDAD;

/*==============================================================*/
/* Table: CHOFER                                                */
/*==============================================================*/
create table CHOFER (
   ID_CHOFER            INT4                 not null,
   CEDULA_CHOFER        VARCHAR(10)          null,
   NOMBRES_CHOFER       VARCHAR(20)          null,
   APELLIDOS_CHOFER     VARCHAR(20)          null,
   TELEFONO_CELULAR_CHOFER VARCHAR(10)          null,
   ESTADO               BOOL                 null,
   FECHA_INGRESO_CHOFER DATE                 null,
   VIAJES_TOTAL         INT4                 null,
   constraint PK_CHOFER primary key (ID_CHOFER)
);

/*==============================================================*/
/* Index: CHOFER_PK                                             */
/*==============================================================*/
create unique index CHOFER_PK on CHOFER (
ID_CHOFER
);

/*==============================================================*/
/* Table: CONTROL_CITA                                          */
/*==============================================================*/
create table CONTROL_CITA (
   ID_CITAS             INT4                 not null,
   ID_PACIENTE          INT4                 null,
   ID_DOCTOR            INT4                 null,
   FECHA_CITA           DATE                 null,
   PROX_CITA            DATE                 null,
   DIAGNOSTICO          VARCHAR(100)         null,
   EXAMENES_CITA        VARCHAR(1024)        null,
   constraint PK_CONTROL_CITA primary key (ID_CITAS)
);

/*==============================================================*/
/* Index: CONTROL_CITA_PK                                       */
/*==============================================================*/
create unique index CONTROL_CITA_PK on CONTROL_CITA (
ID_CITAS
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_6_FK on CONTROL_CITA (
ID_PACIENTE
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_7_FK on CONTROL_CITA (
ID_DOCTOR
);

/*==============================================================*/
/* Table: CONTROL_INSUMO                                        */
/*==============================================================*/
create table CONTROL_INSUMO (
   ID_INSUMOS           INT4                 not null,
   CODIGO               VARCHAR(15)          null,
   FECHA_ENTRADA_INSUMO DATE                 null,
   INSUMO               VARCHAR(20)          null,
   DESCRIPCION_INSUMO   VARCHAR(100)         null,
   UNIDAD_TOTAL         INT4                 null,
   VALOR_TOTAL          INT4                 null,
   VENCIMIENTO          DATE                 null,
   CANT_ENTRADA         INT4                 null,
   CANT_SALIDA          INT4                 null,
   CANT_EXISTENCIAS     INT4                 null,
   constraint PK_CONTROL_INSUMO primary key (ID_INSUMOS)
);

/*==============================================================*/
/* Index: CONTROL_INSUMO_PK                                     */
/*==============================================================*/
create unique index CONTROL_INSUMO_PK on CONTROL_INSUMO (
ID_INSUMOS
);

/*==============================================================*/
/* Table: DOCTOR                                                */
/*==============================================================*/
create table DOCTOR (
   ID_DOCTOR            INT4                 not null,
   CEDULA_DOCTOR        VARCHAR(10)          null,
   NOMBRES_DOCTOR       VARCHAR(20)          null,
   APELLIDOS_DOCTOR     VARCHAR(20)          null,
   TRATAMIENTO_DOCTOR   VARCHAR(100)         null,
   PARTOS_REALIZADO     INT4                 null,
   FECHA_INICIO_DOCTOR  DATE                 null,
   constraint PK_DOCTOR primary key (ID_DOCTOR)
);

/*==============================================================*/
/* Index: DOCTOR_PK                                             */
/*==============================================================*/
create unique index DOCTOR_PK on DOCTOR (
ID_DOCTOR
);

/*==============================================================*/
/* Table: PACIENTE                                              */
/*==============================================================*/
create table PACIENTE (
   ID_PACIENTE          INT4                 not null,
   CEDULA_PACIENTE      VARCHAR(10)          null,
   NOMBRES_PACIENTE     VARCHAR(20)          null,
   APELLIDOS_PACIENTE   VARCHAR(20)          null,
   TELEFONO_CELULAR_PACIENTE VARCHAR(10)          null,
   DOMICILIO_PACIENTE   VARCHAR(50)          null,
   MES_ACTUAL_EMBARAZO  DATE                 null,
   MES_PARTO            DATE                 null,
   constraint PK_PACIENTE primary key (ID_PACIENTE)
);

/*==============================================================*/
/* Index: PACIENTE_PK                                           */
/*==============================================================*/
create unique index PACIENTE_PK on PACIENTE (
ID_PACIENTE
);

/*==============================================================*/
/* Table: PERSONAL                                              */
/*==============================================================*/
create table PERSONAL (
   ID_PERSONAL          INT4                 not null,
   CEDULA_PERSONAL      VARCHAR(10)          null,
   NOMBRES_PERSONAL     VARCHAR(20)          null,
   APELLIDOS_PERSONAL   VARCHAR(20)          null,
   FECHA_INICIO_PERSONAL DATE                 null,
   CARGO_PERSONAL       VARCHAR(20)          null,
   constraint PK_PERSONAL primary key (ID_PERSONAL)
);

/*==============================================================*/
/* Index: PERSONAL_PK                                           */
/*==============================================================*/
create unique index PERSONAL_PK on PERSONAL (
ID_PERSONAL
);

/*==============================================================*/
/* Table: RELATIONSHIP_10                                       */
/*==============================================================*/
create table RELATIONSHIP_10 (
   ID_SALA              INT4                 not null,
   ID_PERSONAL          INT4                 not null,
   constraint PK_RELATIONSHIP_10 primary key (ID_SALA, ID_PERSONAL)
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_PK                                    */
/*==============================================================*/
create unique index RELATIONSHIP_10_PK on RELATIONSHIP_10 (
ID_SALA,
ID_PERSONAL
);

/*==============================================================*/
/* Index: RELATIONSHIP_12_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_12_FK on RELATIONSHIP_10 (
ID_PERSONAL
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_10_FK on RELATIONSHIP_10 (
ID_SALA
);

/*==============================================================*/
/* Table: RELATIONSHIP_8                                        */
/*==============================================================*/
create table RELATIONSHIP_8 (
   ID_VIAJES            INT4                 not null,
   ID_PERSONAL          INT4                 not null,
   constraint PK_RELATIONSHIP_8 primary key (ID_VIAJES, ID_PERSONAL)
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_PK                                     */
/*==============================================================*/
create unique index RELATIONSHIP_8_PK on RELATIONSHIP_8 (
ID_VIAJES,
ID_PERSONAL
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_11_FK on RELATIONSHIP_8 (
ID_PERSONAL
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_8_FK on RELATIONSHIP_8 (
ID_VIAJES
);

/*==============================================================*/
/* Table: SALA                                                  */
/*==============================================================*/
create table SALA (
   ID_SALA              INT4                 not null,
   ID_PACIENTE          INT4                 null,
   ID_DOCTOR            INT4                 null,
   ID_INSUMOS           INT4                 null,
   N_SALA               INT4                 null,
   HORA_ENTRADA_SALA    TIME                 null,
   HORA_SALIDA_SALA     TIME                 null,
   FECHA_SALA           DATE                 null,
   TIPO_PARTO           VARCHAR(50)          null,
   CONDICION_NEONATO    VARCHAR(100)         null,
   INCUBADORA           BOOL                 null,
   constraint PK_SALA primary key (ID_SALA)
);

/*==============================================================*/
/* Index: SALA_PK                                               */
/*==============================================================*/
create unique index SALA_PK on SALA (
ID_SALA
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_1_FK on SALA (
ID_PACIENTE
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_2_FK on SALA (
ID_DOCTOR
);

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_9_FK on SALA (
ID_INSUMOS
);

/*==============================================================*/
/* Table: VIAJE_MATERNIDAD                                      */
/*==============================================================*/
create table VIAJE_MATERNIDAD (
   ID_VIAJES            INT4                 not null,
   ID_PACIENTE          INT4                 null,
   ID_CHOFER            INT4                 null,
   FECHA_VIAJE          DATE                 null,
   LUGAR_PARTIDA        VARCHAR(50)          null,
   LUGAR_DESTINO        VARCHAR(50)          null,
   constraint PK_VIAJE_MATERNIDAD primary key (ID_VIAJES)
);

/*==============================================================*/
/* Index: VIAJE_MATERNIDAD_PK                                   */
/*==============================================================*/
create unique index VIAJE_MATERNIDAD_PK on VIAJE_MATERNIDAD (
ID_VIAJES
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_4_FK on VIAJE_MATERNIDAD (
ID_PACIENTE
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_5_FK on VIAJE_MATERNIDAD (
ID_CHOFER
);

alter table CONTROL_CITA
   add constraint FK_CONTROL__RELATIONS_PACIENTE foreign key (ID_PACIENTE)
      references PACIENTE (ID_PACIENTE)
      on delete restrict on update restrict;

alter table CONTROL_CITA
   add constraint FK_CONTROL__RELATIONS_DOCTOR foreign key (ID_DOCTOR)
      references DOCTOR (ID_DOCTOR)
      on delete restrict on update restrict;

alter table RELATIONSHIP_10
   add constraint FK_RELATION_RELATIONS_SALA foreign key (ID_SALA)
      references SALA (ID_SALA)
      on delete restrict on update restrict;

alter table RELATIONSHIP_10
   add constraint FK_RELATION_RELATIONS_PERSONAL foreign key (ID_PERSONAL)
      references PERSONAL (ID_PERSONAL)
      on delete restrict on update restrict;

alter table RELATIONSHIP_8
   add constraint FK_RELATION_RELATIONS_PERSONAL foreign key (ID_PERSONAL)
      references PERSONAL (ID_PERSONAL)
      on delete restrict on update restrict;

alter table RELATIONSHIP_8
   add constraint FK_RELATION_RELATIONS_VIAJE_MA foreign key (ID_VIAJES)
      references VIAJE_MATERNIDAD (ID_VIAJES)
      on delete restrict on update restrict;

alter table SALA
   add constraint FK_SALA_RELATIONS_PACIENTE foreign key (ID_PACIENTE)
      references PACIENTE (ID_PACIENTE)
      on delete restrict on update restrict;

alter table SALA
   add constraint FK_SALA_RELATIONS_DOCTOR foreign key (ID_DOCTOR)
      references DOCTOR (ID_DOCTOR)
      on delete restrict on update restrict;

alter table SALA
   add constraint FK_SALA_RELATIONS_CONTROL_ foreign key (ID_INSUMOS)
      references CONTROL_INSUMO (ID_INSUMOS)
      on delete restrict on update restrict;

alter table VIAJE_MATERNIDAD
   add constraint FK_VIAJE_MA_RELATIONS_PACIENTE foreign key (ID_PACIENTE)
      references PACIENTE (ID_PACIENTE)
      on delete restrict on update restrict;

alter table VIAJE_MATERNIDAD
   add constraint FK_VIAJE_MA_RELATIONS_CHOFER foreign key (ID_CHOFER)
      references CHOFER (ID_CHOFER)
      on delete restrict on update restrict;

