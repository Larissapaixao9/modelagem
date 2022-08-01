CREATE TABLE "public.users" (
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL,
	"id" serial NOT NULL,
	"password" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"name" TEXT NOT NULL,
	"price" numeric NOT NULL,
	"id" serial NOT NULL,
	"pictures" TEXT NOT NULL,
	"category_id" integer NOT NULL,
	"size" TEXT NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.category" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	CONSTRAINT "category_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.payment" (
	"id" serial NOT NULL,
	"prices" numeric NOT NULL,
	"date" DATE NOT NULL DEFAULT 'now()',
	"adress_id" integer NOT NULL,
	"state" TEXT NOT NULL,
	"user_id" integer NOT NULL,
	CONSTRAINT "payment_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.adress" (
	"street" TEXT NOT NULL,
	"id" serial NOT NULL,
	"number" integer NOT NULL,
	"city_id" integer NOT NULL,
	CONSTRAINT "adress_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.city" (
	"name" TEXT NOT NULL,
	"id" serial NOT NULL,
	"state_id" integer NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.states" (
	"name" TEXT NOT NULL,
	"id" serial NOT NULL,
	CONSTRAINT "states_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("category_id") REFERENCES "category"("id");


ALTER TABLE "payment" ADD CONSTRAINT "payment_fk0" FOREIGN KEY ("prices") REFERENCES "products"("id");
ALTER TABLE "payment" ADD CONSTRAINT "payment_fk1" FOREIGN KEY ("adress_id") REFERENCES "adress"("id");
ALTER TABLE "payment" ADD CONSTRAINT "payment_fk2" FOREIGN KEY ("user_id") REFERENCES "users"("id");

ALTER TABLE "adress" ADD CONSTRAINT "adress_fk0" FOREIGN KEY ("city_id") REFERENCES "city"("id");

ALTER TABLE "city" ADD CONSTRAINT "city_fk0" FOREIGN KEY ("state_id") REFERENCES "states"("id");








