package org.esvux.demos.demomultiskin.adapters;

import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import org.esvux.demos.demomultiskin.R;
import org.esvux.demos.demomultiskin.models.Subsidiary;

import java.util.ArrayList;
import java.util.List;

public class SubsidiaryAdapter extends RecyclerView.Adapter<SubsidiaryAdapter.CustomerHolder> {

    List<Subsidiary> items;

    public SubsidiaryAdapter() {
        items = new ArrayList<>();
        items.add(new Subsidiary("Sucursal 001", "S001", "6a Calle zona 1"));
        items.add(new Subsidiary("Sucursal 002", "S002", "Calzada Roosevelt 31-22"));
        items.add(new Subsidiary("Sucursal 003", "S003", "4a Avenida 5-89 zona 10"));
        items.add(new Subsidiary("Sucursal 004", "S004", "C.C. Miraflores"));
        items.add(new Subsidiary("Sucursal 005", "S005", "C.C. Montblanc"));
        items.add(new Subsidiary("Sucursal 006", "S006", "C.C. Utz"));
    }

    @Override
    public CustomerHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.tpl_subsidiary, parent, false);
        return new CustomerHolder(view);
    }

    @Override
    public void onBindViewHolder(CustomerHolder holder, int position) {
        Subsidiary item = items.get(position);
        holder.setInfo(item);
    }

    @Override
    public int getItemCount() {
        return items.size();
    }

    class CustomerHolder extends RecyclerView.ViewHolder {
        TextView name, code, address;
        CustomerHolder(View itemView) {
            super(itemView);
            name = itemView.findViewById(R.id.tv_name);
            code = itemView.findViewById(R.id.tv_code);
            address = itemView.findViewById(R.id.tv_address);
        }
        void setInfo(Subsidiary item) {
            name.setText(item.getName());
            code.setText(item.getCode());
            address.setText(item.getAddress());
        }
    }
}
