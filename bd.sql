


-- ----------------------------
-- Sequence structure for bills_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "settings"."bills_id_seq";
CREATE SEQUENCE "settings"."bills_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "settings"."bills_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for identification_configurations_types_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "settings"."identification_configurations_types_id_seq";
CREATE SEQUENCE "settings"."identification_configurations_types_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "settings"."identification_configurations_types_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for identifications_types_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "settings"."identifications_types_id_seq";
CREATE SEQUENCE "settings"."identifications_types_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "settings"."identifications_types_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for modules_ppal_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "settings"."modules_ppal_id_seq";
CREATE SEQUENCE "settings"."modules_ppal_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "settings"."modules_ppal_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for payments_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "settings"."payments_id_seq";
CREATE SEQUENCE "settings"."payments_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "settings"."payments_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for people_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "settings"."people_id_seq";
CREATE SEQUENCE "settings"."people_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "settings"."people_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Sequence structure for status_bill_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "settings"."status_bill_id_seq";
CREATE SEQUENCE "settings"."status_bill_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "settings"."status_bill_id_seq" OWNER TO "postgres";

-- ----------------------------
-- Table structure for bills
-- ----------------------------
DROP TABLE IF EXISTS "settings"."bills";
CREATE TABLE "settings"."bills" (
  "id" int4 NOT NULL DEFAULT nextval('"settings".bills_id_seq'::regclass),
  "person_id" int4 NOT NULL,
  "status_bill_id" int4 NOT NULL DEFAULT 1,
  "bill_value" numeric(20,2) NOT NULL,
  "created_at" timestamp(6) NOT NULL,
  "updated_at" timestamp(6),
  "register_status_id" int4 NOT NULL DEFAULT 1,
  "payment_date" timestamp(6),
  "kwh" int4 NOT NULL DEFAULT 0
)
;
ALTER TABLE "settings"."bills" OWNER TO "postgres";

-- ----------------------------
-- Records of bills
-- ----------------------------
BEGIN;
INSERT INTO "settings"."bills" VALUES (1, 1, 2, 2000.00, '2020-03-06 21:07:19', '2020-03-06 21:29:01', 1, '2020-04-01 00:00:00', 6);
INSERT INTO "settings"."bills" VALUES (2, 2, 1, 50000.00, '2020-03-06 22:43:03', '2020-03-06 22:43:03', 1, '2020-03-06 00:00:00', 54);
INSERT INTO "settings"."bills" VALUES (3, 1, 2, 15000.00, '2020-03-06 22:55:07', '2020-03-06 22:55:07', 1, '2020-03-06 00:00:00', 30);
INSERT INTO "settings"."bills" VALUES (4, 2, 1, 112000.00, '2020-03-06 23:52:06', '2020-03-06 23:52:06', 1, '2020-03-27 00:00:00', 45);
COMMIT;

-- ----------------------------
-- Table structure for identification_configurations_types
-- ----------------------------
DROP TABLE IF EXISTS "settings"."identification_configurations_types";
CREATE TABLE "settings"."identification_configurations_types" (
  "id" int4 NOT NULL DEFAULT nextval('"settings".identification_configurations_types_id_seq'::regclass),
  "identification_type_id" int4 NOT NULL,
  "person_type_id" int4 NOT NULL,
  "row_lock" bool NOT NULL DEFAULT true
)
;
ALTER TABLE "settings"."identification_configurations_types" OWNER TO "postgres";

-- ----------------------------
-- Records of identification_configurations_types
-- ----------------------------
BEGIN;
INSERT INTO "settings"."identification_configurations_types" VALUES (1, 5, 1, 't');
INSERT INTO "settings"."identification_configurations_types" VALUES (2, 1, 2, 't');
INSERT INTO "settings"."identification_configurations_types" VALUES (3, 2, 2, 't');
INSERT INTO "settings"."identification_configurations_types" VALUES (4, 3, 2, 't');
INSERT INTO "settings"."identification_configurations_types" VALUES (5, 4, 2, 't');
INSERT INTO "settings"."identification_configurations_types" VALUES (6, 6, 2, 't');
COMMIT;

-- ----------------------------
-- Table structure for identifications_types
-- ----------------------------
DROP TABLE IF EXISTS "settings"."identifications_types";
CREATE TABLE "settings"."identifications_types" (
  "id" int4 NOT NULL DEFAULT nextval('"settings".identifications_types_id_seq'::regclass),
  "identification_type_name" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "row_lock" bool NOT NULL DEFAULT true
)
;
ALTER TABLE "settings"."identifications_types" OWNER TO "postgres";

-- ----------------------------
-- Records of identifications_types
-- ----------------------------
BEGIN;
INSERT INTO "settings"."identifications_types" VALUES (1, 'R.C', 't');
INSERT INTO "settings"."identifications_types" VALUES (2, 'T.I', 't');
INSERT INTO "settings"."identifications_types" VALUES (3, 'C.C', 't');
INSERT INTO "settings"."identifications_types" VALUES (4, 'C.E', 't');
INSERT INTO "settings"."identifications_types" VALUES (5, 'NIT', 't');
INSERT INTO "settings"."identifications_types" VALUES (6, 'RUT', 't');
COMMIT;

-- ----------------------------
-- Table structure for modules_ppal
-- ----------------------------
DROP TABLE IF EXISTS "settings"."modules_ppal";
CREATE TABLE "settings"."modules_ppal" (
  "id" int4 NOT NULL DEFAULT nextval('"settings".modules_ppal_id_seq'::regclass),
  "module_ppal_name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "created_at" timestamp(6) NOT NULL DEFAULT (substr((now())::text, 0, 20))::timestamp without time zone,
  "updated_at" timestamp(6),
  "row_lock" bool NOT NULL DEFAULT true,
  "url" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "css_icon" varchar(20) COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "settings"."modules_ppal" OWNER TO "postgres";

-- ----------------------------
-- Records of modules_ppal
-- ----------------------------
BEGIN;
INSERT INTO "settings"."modules_ppal" VALUES (2, 'Facturas', '2020-03-06 02:22:43', NULL, 't', 'https://energybill.fredyherrera.com.co/template/bill', 'ti-files');
INSERT INTO "settings"."modules_ppal" VALUES (3, 'Pagos', '2020-03-06 02:23:52', NULL, 't', 'https://energybill.fredyherrera.com.co/template/payment', 'ti-money');
INSERT INTO "settings"."modules_ppal" VALUES (1, 'Clientes', '2020-03-06 02:21:24', NULL, 't', 'https://energybill.fredyherrera.com.co/template/people', 'ti-user');
COMMIT;

-- ----------------------------
-- Table structure for payments
-- ----------------------------
DROP TABLE IF EXISTS "settings"."payments";
CREATE TABLE "settings"."payments" (
  "id" int4 NOT NULL DEFAULT nextval('"settings".payments_id_seq'::regclass),
  "bill_id" int4 NOT NULL,
  "created_at" timestamp(6) NOT NULL,
  "updated_at" timestamp(6),
  "register_status_id" int4 NOT NULL DEFAULT 1
)
;
ALTER TABLE "settings"."payments" OWNER TO "postgres";

-- ----------------------------
-- Records of payments
-- ----------------------------
BEGIN;
INSERT INTO "settings"."payments" VALUES (1, 1, '2020-03-06 22:34:54', '2020-03-06 22:40:19', 1);
INSERT INTO "settings"."payments" VALUES (2, 3, '2020-03-06 22:43:21', '2020-03-06 22:55:19', 1);
COMMIT;

-- ----------------------------
-- Table structure for people
-- ----------------------------
DROP TABLE IF EXISTS "settings"."people";
CREATE TABLE "settings"."people" (
  "id" int4 NOT NULL DEFAULT nextval('"settings".people_id_seq'::regclass),
  "identification_number" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "verification_digit" int4,
  "person_status_id" int4 NOT NULL DEFAULT 1,
  "person_type_id" int4 NOT NULL DEFAULT 2,
  "identification_type_id" int4 NOT NULL DEFAULT 3,
  "first_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "second_name" varchar(100) COLLATE "pg_catalog"."default",
  "first_last_name" varchar(50) COLLATE "pg_catalog"."default",
  "second_last_name" varchar(50) COLLATE "pg_catalog"."default",
  "address" varchar(500) COLLATE "pg_catalog"."default",
  "cell_phone" varchar(50) COLLATE "pg_catalog"."default",
  "email" varchar(150) COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) NOT NULL DEFAULT (substr((now())::text, 0, 20))::timestamp without time zone,
  "updated_at" timestamp(6),
  "register_status_id" int4 NOT NULL DEFAULT 1,
  "person_gender_id" int4
)
;
ALTER TABLE "settings"."people" OWNER TO "postgres";

-- ----------------------------
-- Records of people
-- ----------------------------
BEGIN;
INSERT INTO "settings"."people" VALUES (1, '1007140453', NULL, 1, 2, 3, 'FREDY', NULL, 'HERRERA', NULL, NULL, NULL, NULL, '2020-03-06 19:21:00', '2020-03-06 19:29:54', 1, 1);
INSERT INTO "settings"."people" VALUES (2, '15879654', NULL, 1, 2, 3, 'LUIS', 'ANTONIO', 'LOPEZ', NULL, NULL, NULL, NULL, '2020-03-06 22:42:44', '2020-03-06 22:42:44', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for people_genders
-- ----------------------------
DROP TABLE IF EXISTS "settings"."people_genders";
CREATE TABLE "settings"."people_genders" (
  "id" int4 NOT NULL,
  "gender_name" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "row_lock" bool NOT NULL DEFAULT true
)
;
ALTER TABLE "settings"."people_genders" OWNER TO "postgres";

-- ----------------------------
-- Records of people_genders
-- ----------------------------
BEGIN;
INSERT INTO "settings"."people_genders" VALUES (1, 'MASCULINO', 't');
INSERT INTO "settings"."people_genders" VALUES (2, 'FEMENINO', 't');
COMMIT;

-- ----------------------------
-- Table structure for people_status
-- ----------------------------
DROP TABLE IF EXISTS "settings"."people_status";
CREATE TABLE "settings"."people_status" (
  "id" int4 NOT NULL,
  "person_status_name" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "row_lock" bool NOT NULL DEFAULT true
)
;
ALTER TABLE "settings"."people_status" OWNER TO "postgres";

-- ----------------------------
-- Records of people_status
-- ----------------------------
BEGIN;
INSERT INTO "settings"."people_status" VALUES (1, 'ACTIVO', 't');
INSERT INTO "settings"."people_status" VALUES (2, 'RETIRADO', 't');
INSERT INTO "settings"."people_status" VALUES (3, 'INACTIVO', 't');
COMMIT;

-- ----------------------------
-- Table structure for people_types
-- ----------------------------
DROP TABLE IF EXISTS "settings"."people_types";
CREATE TABLE "settings"."people_types" (
  "id" int4 NOT NULL,
  "person_type_name" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "row_lock" bool NOT NULL DEFAULT true
)
;
ALTER TABLE "settings"."people_types" OWNER TO "postgres";

-- ----------------------------
-- Records of people_types
-- ----------------------------
BEGIN;
INSERT INTO "settings"."people_types" VALUES (1, 'JURIDICA', 't');
INSERT INTO "settings"."people_types" VALUES (2, 'NATURAL', 't');
COMMIT;

-- ----------------------------
-- Table structure for registers_status
-- ----------------------------
DROP TABLE IF EXISTS "settings"."registers_status";
CREATE TABLE "settings"."registers_status" (
  "id" int4 NOT NULL,
  "register_name" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "row_lock" bool NOT NULL DEFAULT true
)
;
ALTER TABLE "settings"."registers_status" OWNER TO "postgres";

-- ----------------------------
-- Records of registers_status
-- ----------------------------
BEGIN;
INSERT INTO "settings"."registers_status" VALUES (1, 'VIGENTE', 't');
INSERT INTO "settings"."registers_status" VALUES (2, 'ELIMINADO', 't');
COMMIT;

-- ----------------------------
-- Table structure for status_bill
-- ----------------------------
DROP TABLE IF EXISTS "settings"."status_bill";
CREATE TABLE "settings"."status_bill" (
  "id" int4 NOT NULL DEFAULT nextval('"settings".status_bill_id_seq'::regclass),
  "name_status_bill" varchar(100) COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "settings"."status_bill" OWNER TO "postgres";

-- ----------------------------
-- Records of status_bill
-- ----------------------------
BEGIN;
INSERT INTO "settings"."status_bill" VALUES (1, 'PENDIENTE');
INSERT INTO "settings"."status_bill" VALUES (2, 'PAGA');
COMMIT;

-- ----------------------------
-- Function structure for pl_allowed_module
-- ----------------------------
DROP FUNCTION IF EXISTS "settings"."pl_allowed_module"("pe_json_in" json);
CREATE OR REPLACE FUNCTION "settings"."pl_allowed_module"("pe_json_in" json)
  RETURNS SETOF "pg_catalog"."record" AS $BODY$
DECLARE

vjson_in ALIAS FOR $1;

vmodule_ppal_id integer:=vjson_in->>'module_ppal_id';


r_module_ppl RECORD;
vcount INTEGER;
vsql TEXT;
r_return RECORD;
vnro_paginasmodulo_cont integer;
vfilter_actions text;
BEGIN

vfilter_actions:=CONCAT('SELECT id FROM settings.pages_actions WHERE register_status_id =1 ');



vsql:=CONCAT('SELECT COUNT(*) OVER()::INTEGER count,id,module_ppal_name::text,css_icon::text,url::text FROM  settings.modules_ppal WHERE url IS NOT NULL');

IF(vmodule_ppal_id<>0)THEN
	vsql:=CONCAT(vsql,'  AND id=',vmodule_ppal_id,' ');
END IF;

vsql:=CONCAT(vsql,'  ORDER BY id ');


FOR r_module_ppl IN EXECUTE vsql
 LOOP
	RETURN NEXT r_module_ppl;	
END LOOP;

RETURN ;
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION "settings"."pl_allowed_module"("pe_json_in" json) OWNER TO "postgres";

-- ----------------------------
-- Function structure for tr_after_insert_payments
-- ----------------------------
DROP FUNCTION IF EXISTS "settings"."tr_after_insert_payments"();
CREATE OR REPLACE FUNCTION "settings"."tr_after_insert_payments"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
DECLARE

BEGIN

IF(TG_OP = 'INSERT')
THEN

	UPDATE settings.bills SET status_bill_id=2 WHERE id=NEW.bill_id;

	RETURN NEW;
END IF;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION "settings"."tr_after_insert_payments"() OWNER TO "postgres";

-- ----------------------------
-- Function structure for tr_after_update_payments
-- ----------------------------
DROP FUNCTION IF EXISTS "settings"."tr_after_update_payments"();
CREATE OR REPLACE FUNCTION "settings"."tr_after_update_payments"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
DECLARE

BEGIN

IF(TG_OP = 'UPDATE')
THEN
	
	IF(NEW.bill_id<>OLD.bill_id)THEN
	   UPDATE settings.bills SET status_bill_id=2 WHERE id=NEW.bill_id;
	    UPDATE settings.bills SET status_bill_id=1 WHERE id=OLD.bill_id;
	END IF;
	IF(NEW.register_status_id=2)THEN
	UPDATE settings.bills SET status_bill_id=1 WHERE id=NEW.bill_id;
	END IF;
	IF(NEW.register_status_id=1)THEN
	UPDATE settings.bills SET status_bill_id=2 WHERE id=NEW.bill_id;
	END IF;

	RETURN NEW;
END IF;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION "settings"."tr_after_update_payments"() OWNER TO "postgres";

-- ----------------------------
-- Function structure for tr_before_insert_people
-- ----------------------------
DROP FUNCTION IF EXISTS "settings"."tr_before_insert_people"();
CREATE OR REPLACE FUNCTION "settings"."tr_before_insert_people"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
DECLARE

BEGIN

IF(TG_OP = 'INSERT')
THEN

	IF(NEW.person_type_id = 1)THEN	
		NEW.verification_digit:= (SELECT pl_get_verification_digit FROM util_bd.pl_get_verification_digit(NEW.identification_number::TEXT));
	END IF;

	IF(NEW.email IS NOT NULL)THEN	
		IF(SELECT pl_check_records FROM util_bd.pl_check_records('settings.people', CONCAT('email=''',NEW.email,''))) IS TRUE THEN	
			RAISE 'EL EMAIL % YA EXISTE',NEW.email;
		END IF;
	END IF;

	RETURN NEW;
END IF;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION "settings"."tr_before_insert_people"() OWNER TO "postgres";

-- ----------------------------
-- Function structure for tr_before_update_people
-- ----------------------------
DROP FUNCTION IF EXISTS "settings"."tr_before_update_people"();
CREATE OR REPLACE FUNCTION "settings"."tr_before_update_people"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
DECLARE

BEGIN

IF(TG_OP = 'UPDATE')
THEN

	IF(NEW.person_type_id = 1)THEN	
		NEW.verification_digit:= (SELECT pl_get_verification_digit FROM util_bd.pl_get_verification_digit(NEW.identification_number::TEXT));
	END IF;
	
	IF(NEW.email IS NOT NULL)THEN	
		IF(SELECT pl_check_records FROM util_bd.pl_check_records('settings.people', CONCAT('email=''',NEW.email,''' AND id<>',NEW.id))) IS TRUE THEN	
			RAISE 'EL EMAIL % YA EXISTE',NEW.email;
		END IF;
	END IF;
	RETURN NEW;
END IF;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION "settings"."tr_before_update_people"() OWNER TO "postgres";

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "settings"."bills_id_seq"
OWNED BY "settings"."bills"."id";
SELECT setval('"settings"."bills_id_seq"', 5, true);
ALTER SEQUENCE "settings"."identification_configurations_types_id_seq"
OWNED BY "settings"."identification_configurations_types"."id";
SELECT setval('"settings"."identification_configurations_types_id_seq"', 2, false);
ALTER SEQUENCE "settings"."identifications_types_id_seq"
OWNED BY "settings"."identifications_types"."id";
SELECT setval('"settings"."identifications_types_id_seq"', 2, false);
ALTER SEQUENCE "settings"."modules_ppal_id_seq"
OWNED BY "settings"."modules_ppal"."id";
SELECT setval('"settings"."modules_ppal_id_seq"', 3, true);
ALTER SEQUENCE "settings"."payments_id_seq"
OWNED BY "settings"."payments"."id";
SELECT setval('"settings"."payments_id_seq"', 3, true);
ALTER SEQUENCE "settings"."people_id_seq"
OWNED BY "settings"."people"."id";
SELECT setval('"settings"."people_id_seq"', 3, true);
ALTER SEQUENCE "settings"."status_bill_id_seq"
OWNED BY "settings"."status_bill"."id";
SELECT setval('"settings"."status_bill_id_seq"', 2, false);

-- ----------------------------
-- Primary Key structure for table bills
-- ----------------------------
ALTER TABLE "settings"."bills" ADD CONSTRAINT "bills_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table identification_configurations_types
-- ----------------------------
ALTER TABLE "settings"."identification_configurations_types" ADD CONSTRAINT "identification_configurations_types_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table identifications_types
-- ----------------------------
ALTER TABLE "settings"."identifications_types" ADD CONSTRAINT "identifications_types_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table modules_ppal
-- ----------------------------
ALTER TABLE "settings"."modules_ppal" ADD CONSTRAINT "modules_ppal_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Triggers structure for table payments
-- ----------------------------
CREATE TRIGGER "tr_after_insert_payments" AFTER INSERT ON "settings"."payments"
FOR EACH ROW
EXECUTE PROCEDURE "settings"."tr_after_insert_payments"();
CREATE TRIGGER "tr_after_update_payments" AFTER UPDATE ON "settings"."payments"
FOR EACH ROW
EXECUTE PROCEDURE "settings"."tr_after_update_payments"();

-- ----------------------------
-- Primary Key structure for table payments
-- ----------------------------
ALTER TABLE "settings"."payments" ADD CONSTRAINT "payments_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Triggers structure for table people
-- ----------------------------
CREATE TRIGGER "tr_before_insert_people" BEFORE INSERT ON "settings"."people"
FOR EACH ROW
EXECUTE PROCEDURE "settings"."tr_before_insert_people"();
CREATE TRIGGER "tr_before_update_people" BEFORE UPDATE ON "settings"."people"
FOR EACH ROW
EXECUTE PROCEDURE "settings"."tr_before_update_people"();

-- ----------------------------
-- Uniques structure for table people
-- ----------------------------
ALTER TABLE "settings"."people" ADD CONSTRAINT "people_email_key" UNIQUE ("email");
ALTER TABLE "settings"."people" ADD CONSTRAINT "people_identification_type_id_identification_number_key" UNIQUE ("identification_type_id", "identification_number");

-- ----------------------------
-- Primary Key structure for table people
-- ----------------------------
ALTER TABLE "settings"."people" ADD CONSTRAINT "people_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table people_genders
-- ----------------------------
ALTER TABLE "settings"."people_genders" ADD CONSTRAINT "peoples_genders_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table people_status
-- ----------------------------
ALTER TABLE "settings"."people_status" ADD CONSTRAINT "people_status_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table people_types
-- ----------------------------
ALTER TABLE "settings"."people_types" ADD CONSTRAINT "people_types_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table registers_status
-- ----------------------------
ALTER TABLE "settings"."registers_status" ADD CONSTRAINT "registers_status_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table status_bill
-- ----------------------------
ALTER TABLE "settings"."status_bill" ADD CONSTRAINT "status_bill_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table bills
-- ----------------------------
ALTER TABLE "settings"."bills" ADD CONSTRAINT "fk_person" FOREIGN KEY ("person_id") REFERENCES "settings"."people" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "settings"."bills" ADD CONSTRAINT "pk_status_bill" FOREIGN KEY ("status_bill_id") REFERENCES "settings"."status_bill" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table identification_configurations_types
-- ----------------------------
ALTER TABLE "settings"."identification_configurations_types" ADD CONSTRAINT "identification_configurations_types_identification_type_id_fkey" FOREIGN KEY ("identification_type_id") REFERENCES "settings"."identifications_types" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "settings"."identification_configurations_types" ADD CONSTRAINT "identification_configurations_types_person_type_id_fkey" FOREIGN KEY ("person_type_id") REFERENCES "settings"."people_types" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table payments
-- ----------------------------
ALTER TABLE "settings"."payments" ADD CONSTRAINT "fk_bill" FOREIGN KEY ("bill_id") REFERENCES "settings"."bills" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table people
-- ----------------------------
ALTER TABLE "settings"."people" ADD CONSTRAINT "people_identification_type_id_fkey" FOREIGN KEY ("identification_type_id") REFERENCES "settings"."identifications_types" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "settings"."people" ADD CONSTRAINT "people_person_gender_id_fkey" FOREIGN KEY ("person_gender_id") REFERENCES "settings"."people_genders" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "settings"."people" ADD CONSTRAINT "people_person_status_id_fkey" FOREIGN KEY ("person_status_id") REFERENCES "settings"."people_status" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "settings"."people" ADD CONSTRAINT "people_person_type_id_fkey" FOREIGN KEY ("person_type_id") REFERENCES "settings"."people_types" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "settings"."people" ADD CONSTRAINT "people_register_status_id_fkey" FOREIGN KEY ("register_status_id") REFERENCES "settings"."registers_status" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
