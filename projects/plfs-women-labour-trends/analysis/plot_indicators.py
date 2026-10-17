#!/usr/bin/env python3
"""Recreate figures from the committed official-summary CSV."""
import csv
from pathlib import Path
import matplotlib.pyplot as plt
ROOT=Path(__file__).resolve().parents[1]
with (ROOT/"data"/"female_labour_indicators_2017-18_to_2023-24.csv").open(encoding="utf-8",newline="") as f:
    rows=list(csv.DictReader(f))
periods=sorted({r["survey_period"] for r in rows},key=lambda p:int(p[:4]))
colors={"rural":"#167c80","urban":"#ef8f35","all_india":"#5e62a8"}
labels={"rural":"Rural","urban":"Urban","all_india":"Rural + urban"}
spec={"LFPR":("Female labour force participation rate (LFPR)","female_lfpr.svg"),"WPR":("Female worker population ratio (WPR)","female_wpr.svg"),"UR":("Female unemployment rate (UR)","female_ur.svg")}
for code,(title,file) in spec.items():
    fig,ax=plt.subplots(figsize=(10,5.6),layout="constrained")
    for geo in labels:
        series={r["survey_period"]:float(r["rate_percent"]) for r in rows if r["indicator"]==code and r["geography"]==geo}
        ax.plot(periods,[series[p] for p in periods],marker="o",linewidth=2.5,color=colors[geo],label=labels[geo])
    ax.set_title(title,loc="left",weight="bold",pad=16); ax.set_ylabel("Percent"); ax.set_xlabel("PLFS survey period")
    ax.grid(axis="y",alpha=.25); ax.spines[["top","right"]].set_visible(False); ax.legend(frameon=False,ncol=3)
    ax.text(0,-.22,"Women age 15+ | usual status (ps+ss) | MoSPI Sarvekshana 117, Tables 1–3",transform=ax.transAxes,fontsize=8)
    fig.savefig(ROOT/"figures"/file,format="svg",facecolor="#fbfaf7"); plt.close(fig)
