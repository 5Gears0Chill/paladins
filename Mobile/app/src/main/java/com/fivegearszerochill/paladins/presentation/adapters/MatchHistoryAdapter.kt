package com.fivegearszerochill.paladins.presentation.adapters

import android.annotation.SuppressLint
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.paging.PagingDataAdapter
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.RecyclerView
import com.fivegearszerochill.paladins.R
import com.fivegearszerochill.paladins.domain.interfaces.listeners.OnMatchHistoryClickedListener
import com.fivegearszerochill.paladins.domain.models.player.MatchHistoryModel
import kotlinx.android.synthetic.main.match_history_item_view.view.*

class MatchHistoryAdapter(private var listener: OnMatchHistoryClickedListener, diffCallback: DiffUtil.ItemCallback<MatchHistoryModel>):
    PagingDataAdapter<MatchHistoryModel, MatchHistoryViewHolder>(diffCallback) {


    override fun onBindViewHolder(holder: MatchHistoryViewHolder, position: Int) {
        val item = getItem(position)
        holder.bind(item)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): MatchHistoryViewHolder {
        val inflater = LayoutInflater.from(parent.context)
        return MatchHistoryViewHolder(inflater,parent,listener)
    }

    object MatchHistoryModelComparator: DiffUtil.ItemCallback<MatchHistoryModel>(){
        override fun areItemsTheSame(oldItem: MatchHistoryModel, newItem: MatchHistoryModel): Boolean {
            return oldItem.id == newItem.id
        }

        override fun areContentsTheSame(oldItem: MatchHistoryModel, newItem: MatchHistoryModel): Boolean {
            return oldItem == newItem
        }
    }
}

class MatchHistoryViewHolder(inflater: LayoutInflater, itemView: ViewGroup, var listener: OnMatchHistoryClickedListener)
    : RecyclerView.ViewHolder( inflater.inflate(R.layout.match_history_item_view, itemView,false)) {

    @SuppressLint("SetTextI18n")
    fun bind(model: MatchHistoryModel?){
        if (model != null) {
            itemView.match_id.text = model.paladinsMatchID.toString()
            itemView.match_result.text = model.matchResult
            itemView.kda.text = "KDA: ${model.kills?.toInt()} / ${model.deaths?.toInt()} / ${model.assists?.toInt()}"
            itemView.view_match_details.setOnClickListener {
                if (absoluteAdapterPosition != RecyclerView.NO_POSITION) {
                    model.id?.toInt()?.let {
                        listener.onViewMatchDetailsClicked(
                            model.paladinsMatchID.toString(),
                            it
                        )
                    }
                }
            }

        }
    }
}