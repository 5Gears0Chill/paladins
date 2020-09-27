package com.fivegearszerochill.paladins.presentation.adapters

import android.annotation.SuppressLint
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.paging.PagingDataAdapter
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.fivegearszerochill.paladins.R
import com.fivegearszerochill.paladins.domain.models.player.ChampionStatsModel
import kotlinx.android.synthetic.main.champion_item_view.view.champion_image
import kotlinx.android.synthetic.main.champion_stats_item_view.view.*

class ChampionStatsAdapter(diffCallback: DiffUtil.ItemCallback<ChampionStatsModel>) :
    PagingDataAdapter<ChampionStatsModel, ChampionStatsViewHolder>(diffCallback){

    override fun onBindViewHolder(holder: ChampionStatsViewHolder, position: Int) {
        val item = getItem(position)
        holder.bind(item)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ChampionStatsViewHolder {
        val inflater = LayoutInflater.from(parent.context)
        return ChampionStatsViewHolder(inflater,parent)
    }

    object ChampionStatsModelComparator: DiffUtil.ItemCallback<ChampionStatsModel>(){
        override fun areItemsTheSame(oldItem: ChampionStatsModel, newItem: ChampionStatsModel): Boolean {
            return oldItem.id == newItem.id
        }

        override fun areContentsTheSame(oldItem: ChampionStatsModel, newItem: ChampionStatsModel): Boolean {
            return oldItem == newItem
        }
    }
}

class ChampionStatsViewHolder(inflater: LayoutInflater, itemView: ViewGroup)
    : RecyclerView.ViewHolder( inflater.inflate(R.layout.champion_stats_item_view, itemView,false)) {

    @SuppressLint("SetTextI18n")
    fun bind(model: ChampionStatsModel?){
        itemView.champion_name.text = model?.championName
        itemView.wins_losses.text = "${model?.wins} Wins | ${model?.losses} Losses"
        itemView.kda.text = "KDA: ${model?.kills}/${model?.deaths}/${model?.assists}"

        Glide.with(itemView)
            .load(model?.championUrl)
            .into(itemView.champion_image)
    }
}