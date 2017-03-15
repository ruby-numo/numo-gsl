<% nd = (/histogram2d/ =~ struct) ? 2 : 1 %>
/*
  @overload <%=name%>()
  @return [DFloat]    narray of <%=name%> field in <%=struct%>.

  returns <%=name%> field in <%=struct%> struct.
  <%= description %>
*/
static VALUE
<%=c_func%>(VALUE self)<% set n_arg:0 %>
{
    <%=struct%> *w;
    double *d;
    VALUE v;
    size_t n, i, shape[<%=nd%>];

    TypedData_Get_Struct(self, <%=struct%>, &<%=data_type_var%>, w);

    <%if /([xy]?)range/ =~ name %>
    shape[0] = n = w->n<%=$1%>+1;
    <%elsif nd==1%>
    shape[0] = n = w->n;
    <%else%>
    n = w->nx * w->ny;
    shape[0] = w->nx;
    shape[1] = w->ny;
    <%end%>

    v = rb_narray_new(numo_cDFloat, <%=nd%>, shape);
    d = (double*)na_get_pointer_for_write(v);
    for (i=0; i<n; i++) {
        d[i] = w-><%=name%>[i];
    }
    return v;
}
