static void
iter_<%=c_func%>(na_loop_t *const lp)
{
    int    c0, c1;
    double c2, *c4;
    <%=struct%> *w;
    void **opt = (void**)(lp->opt_ptr);

    w  = (<%=struct%>*)(opt[0]);
    c0 = *(int*)(opt[1]); //<%=args[0][1]%>
    c1 = *(int*)(opt[2]); //<%=args[1][1]%>
    c2 = *(double*)GET_PTR(lp,0); //<%=args[2][1]%>
    c4 =  (double*)GET_PTR(lp,1); //<%=args[4][1]%>
    <%=func_name%>(c0,c1,c2,w,c4);
}

/*
  @overload <%=name%>(<%=args[0][1]%>,<%=args[1][1]%>,<%=args[2][1]%>)

  @param [Integer]  <%=args[0][1]%>
  @param [Integer]  <%=args[1][1]%>
  @param [Numo::DFloat]  <%=args[2][1]%>
  @return [Numo::DFloat]  returns <%=args[4][1]%>

  <%= description %>
*/
static VALUE
<%=c_func%>(VALUE self, VALUE v0, VALUE v1, VALUE v2)<% set n_arg:3 %>
{
    <%=struct%> *w;
    int nmin, nmax;
    size_t shape[1];
    ndfunc_arg_in_t ain[1] = {{cDF,0}};
    ndfunc_arg_out_t aout[1] = {{cDF,1,shape}};
    ndfunc_t ndf = {iter_<%=c_func%>,NO_LOOP|NDF_INPLACE|NDF_EXTRACT,1,1,ain,aout};
    void *opt[3];

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    nmin = NUM2INT(v0);
    nmax = NUM2INT(v1);
    opt[0] = w;
    opt[1] = &nmin;
    opt[2] = &nmax;
    if (nmin<0 || nmax<0 || nmin>nmax) {
        rb_raise(rb_eArgError,"should be nmin>=0 && nmax>=0 && nmin<=nmax");
    }
    shape[0] = nmax-nmin+1;
    return na_ndloop3(&ndf,opt,1,v2);
}
