-- Creating table tbl_ref 
CREATE TABLE tbl_ref (
	id serial4 NOT NULL,
	"name" text NULL,
	required_value bool NULL,
	CONSTRAINT tbl_ref_pkey PRIMARY KEY (id)
);


-- Creating our checking function 
CREATE OR REPLACE FUNCTION check_ref_id(p_ref_id integer, p_ref_note text)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
declare 
    v_ret bool;
begin
    select required_value into v_ret from tbl_ref where id = p_ref_id;

    if (v_ret)and(p_ref_note is null) then 
        return false; 
    end if;

    return true; 
END;
$function$
;


-- Creating table "tbl_val" and using our function on the constraint statement 
CREATE TABLE tbl_val (
	id serial4 NOT NULL,
	ref_id int4 NOT NULL,
	ref_note text NULL,
	CONSTRAINT tbl_val_check CHECK (check_ref_id(ref_id, ref_note)),
	CONSTRAINT tbl_val_pkey PRIMARY KEY (id)
);