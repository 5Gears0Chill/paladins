package com.fivegearszerochill.paladins.presentation.adapters

import android.view.LayoutInflater
import android.view.ViewGroup
import android.widget.LinearLayout
import androidx.paging.PagingDataAdapter
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.fivegearszerochill.paladins.R
import com.fivegearszerochill.paladins.domain.models.player.LoadoutModel
import kotlinx.android.synthetic.main.loadout_item_view.view.*

class LoadoutAdapter (diffCallback: DiffUtil.ItemCallback<LoadoutModel>)
    : PagingDataAdapter<LoadoutModel, LoadoutViewHolder>(diffCallback){

    override fun onBindViewHolder(holder: LoadoutViewHolder, position: Int) {
        val item = getItem(position)
        holder.bind(item)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): LoadoutViewHolder {
        val inflater = LayoutInflater.from(parent.context)
        return LoadoutViewHolder(inflater,parent)
    }

    object LoadoutModelComparator: DiffUtil.ItemCallback<LoadoutModel>(){
        override fun areItemsTheSame(oldItem: LoadoutModel, newItem: LoadoutModel): Boolean {
            return oldItem.id == newItem.id
        }

        override fun areContentsTheSame(oldItem: LoadoutModel, newItem: LoadoutModel): Boolean {
            return oldItem == newItem
        }
    }
}
class LoadoutViewHolder(inflater: LayoutInflater, itemView: ViewGroup)
    : RecyclerView.ViewHolder( inflater.inflate(R.layout.loadout_item_view, itemView,false)) {

    fun bind(model: LoadoutModel?){
        if (model != null) {
            val childLayoutManager = LinearLayoutManager(itemView.context, RecyclerView.HORIZONTAL, false)
            itemView.items_recycler_view.apply {
                layoutManager = childLayoutManager
                adapter = LoadoutItemAdapter(model.loadoutItems)
            }
            Glide.with(itemView)
                .load(model.championUrl)
                .into(itemView.champion_image)
            itemView.champion_name.text = model.championName
            itemView.loadout_name.text = model.loadoutName
        }
    }
}

