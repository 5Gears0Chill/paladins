package com.fivegearszerochill.paladins.presentation.adapters

import android.annotation.SuppressLint
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.appcompat.content.res.AppCompatResources.getColorStateList
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.fivegearszerochill.paladins.R
import com.fivegearszerochill.paladins.domain.constants.Units
import com.fivegearszerochill.paladins.domain.models.match.MatchDetailsModel
import com.fivegearszerochill.paladins.domain.util.appendUnit
import com.fivegearszerochill.paladins.presentation.resolvers.ColorResolver
import kotlinx.android.synthetic.main.player_match_details_item_view.view.*

class PlayerMatchStatsAdapter :
    RecyclerView.Adapter<PlayerMatchStatsViewHolder>() {

    private var data: ArrayList<MatchDetailsModel> = ArrayList()


    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): PlayerMatchStatsViewHolder {
        val inflater = LayoutInflater.from(parent.context)
        return PlayerMatchStatsViewHolder(inflater, parent)
    }

    override fun onBindViewHolder(holder: PlayerMatchStatsViewHolder, position: Int) {
        holder.bind(data[position])
    }

    override fun getItemCount(): Int {
        return data.size
    }

    fun addAll(models: List<MatchDetailsModel>) {
        for (m in models) add(m)
    }

    private fun add(model: MatchDetailsModel) {
        data.add(model)
        notifyItemChanged(data.size - 1)
    }

}

class PlayerMatchStatsViewHolder(inflater: LayoutInflater, itemView: ViewGroup) :
    RecyclerView.ViewHolder(
        inflater.inflate(
            R.layout.player_match_details_item_view,
            itemView,
            false
        )
    ) {

    @SuppressLint("SetTextI18n")
    fun bind(model: MatchDetailsModel?) {
        itemView.player_account_level.text = model?.playerAccountLevel.toString()
        itemView.player_account_level.chipBackgroundColor = getColorStateList(
            itemView.context, ColorResolver
                .determinePlayerAccountLevelColor(model?.playerAccountLevel)
        )
        itemView.player_name.text = model?.playerName
        Glide.with(itemView)
            .load(model?.championIconUrl)
            .into(itemView.champion_image)
        itemView.champion_name.text = model?.championName
        itemView.self_healing.text = model?.selfHealing.toString().appendUnit(
            Units.selfHealing
        )
        itemView.self_healing.chipBackgroundColor = getColorStateList(
            itemView.context,
            ColorResolver.determinePlayerHealingLevelColor(model?.selfHealing)
        )
        itemView.gold_earned_per_minute.text = model?.goldEarnedPerMinute.toString().appendUnit(
            Units.goldPerMin
        )
        itemView.gold_earned_per_minute.chipBackgroundColor = getColorStateList(
            itemView.context,
            R.color.OldGold
        )
        itemView.gold_earned_total.text = model?.goldEarnedTotal.toString().appendUnit(
            Units.goldEarnedTotal
        )
        itemView.gold_earned_total.chipBackgroundColor = getColorStateList(
            itemView.context,
            R.color.NavajoWhite
        )
        itemView.healing_done.text = model?.healingDone.toString().appendUnit(
            Units.healingDone
        )
        itemView.healing_done.chipBackgroundColor = getColorStateList(
            itemView.context,
            ColorResolver.determinePlayerHealingLevelColor(model?.selfHealing)
        )
        itemView.damage_done_in_hand.text = model?.damageDoneInHand.toString().appendUnit(
            Units.damageDone
        )
        itemView.damage_mitigated.text = model?.damageMitigated.toString().appendUnit(
            Units.damageMitigated
        )
        itemView.damage_taken.text = model?.damageTaken.toString().appendUnit(
            Units.damageTaken
        )
        itemView.kills_deaths_assists.text =
            "${model?.kills} /${model?.deaths} / ${model?.assists}".appendUnit(
                Units.kda
            )
        itemView.league_points.text = model?.leaguePoints.toString().appendUnit(
            Units.leaguePoints
        )
    }
}