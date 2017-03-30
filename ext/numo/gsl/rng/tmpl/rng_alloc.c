<%
set name: "new"
set singleton: true
%>
/*
  :nodoc:
 */
static VALUE
<%=c_func(:nodef)%>(int argc, VALUE *argv, VALUE self, const <%=type_struct%> *t)
{
    <%=struct%> *w;

    if (argc > 1) {
        rb_raise(rb_eArgError,"wrong number of arguments (given %d, expected 0..1)", argc);
    }
    w = <%=func_name%>(t);
    if (!w) {
        rb_raise(rb_eNoMemError,"fail to allocate struct");
    }
    if (argc == 1) {
        gsl_rng_set(w, NUM2ULONG(argv[0]));
    }
    return TypedData_Wrap_Struct(<%=class_var%>, &<%=data_type_var%>, (void*)w);
}
