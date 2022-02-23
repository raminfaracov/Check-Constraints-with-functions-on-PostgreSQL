Let's discuss such an interesting issue.

For example, we have 2 tables:
1) tbl_ref 
2) tbl_val 

I want to set the required `ref_note` field when `ref_id` exists in the `tbl_ref` table and the field `required_value` is true. When `required_value` is false then I shouldn't be set the required `ref_note` field.

This is a customized checking, so we can not do this using foreign keys and using other standard functions. We need a write our custom checking function which will be used on constraints.
