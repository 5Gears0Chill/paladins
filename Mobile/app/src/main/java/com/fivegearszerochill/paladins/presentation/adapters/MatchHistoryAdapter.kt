package com.fivegearszerochill.paladins.presentation.adapters

import android.annotation.SuppressLint
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.fivegearszerochill.paladins.R
import com.fivegearszerochill.paladins.domain.models.player.FriendModel
import com.fivegearszerochill.paladins.domain.models.player.MatchHistoryModel
import com.fivegearszerochill.paladins.domain.util.empty
import kotlinx.android.synthetic.main.match_history_item_view.view.*

class MatchHistoryAdapter: RecyclerView.Adapter<MatchHistoryViewHolder>() {

    private val dataSource = ArrayList<MatchHistoryModel>()

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): MatchHistoryViewHolder {
        val inflater = LayoutInflater.from(parent.context)

        return MatchHistoryViewHolder(inflater,parent)
    }

    override fun onBindViewHolder(holder: MatchHistoryViewHolder, position: Int) {
        holder.bind(dataSource[position])
    }

    override fun getItemCount(): Int {
        return dataSource.size
    }

    fun addAll(match: List<MatchHistoryModel>){
        for (f in match){
            add(f)
        }
    }

    private fun add(match: MatchHistoryModel){
        dataSource.add(match)
    }
}

class MatchHistoryViewHolder(inflater: LayoutInflater, itemView: ViewGroup)
    : RecyclerView.ViewHolder( inflater.inflate(R.layout.match_history_item_view, itemView,false)) {

    @SuppressLint("SetTextI18n")
    fun bind(model: MatchHistoryModel?){
        if (model != null) {
            itemView.match_id.text = model.paladinsMatchID.toString()
            itemView.match_result.text = model.matchResult
            itemView.kda.text = "KDA: ${model.kills?.toInt()} / ${model.deaths?.toInt()} / ${model.assists?.toInt()}"
        }
    }
}