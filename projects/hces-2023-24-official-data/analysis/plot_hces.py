#!/usr/bin/env python3
"""Plot state MPCE and item-group expenditure from committed HCES tables."""
import csv
from pathlib import Path
import matplotlib.pyplot as plt
ROOT=Path(__file__).resolve().parents[1]
def read(name):
    with (ROOT/"data"/name).open(encoding="utf-8",newline="") as f:return list(csv.DictReader(f))
FIG=ROOT/"figures";FIG.mkdir(exist_ok=True)
states=read("state_mpce_2023-24.csv")
states=[r for r in states if r["state_ut"]!="All-India"]
states.sort(key=lambda r:float(r["mpce_rural_with_imputation_rs"]))
labels=[r["state_ut"] for r in states]; y=list(range(len(states)))
fig,ax=plt.subplots(figsize=(10,12),layout="constrained")
ax.barh([i-.18 for i in y],[float(r["mpce_rural_with_imputation_rs"]) for r in states],height=.35,label="Rural",color="#168078")
ax.barh([i+.18 for i in y],[float(r["mpce_urban_with_imputation_rs"]) for r in states],height=.35,label="Urban",color="#ed9138")
ax.set_yticks(y,labels);ax.set_xlabel("Rs per person per month");ax.set_title("HCES 2023–24 MPCE by State/UT (with imputation)",loc="left",weight="bold");ax.grid(axis="x",alpha=.25);ax.legend(frameon=False);fig.savefig(FIG/"state_mpce.svg",format="svg",facecolor="#fbfaf7");plt.close(fig)
items=read("all_india_item_mpce_2023-24.csv");items=[r for r in items if r["item_group"] not in {"Food total","Non-food total","All items"}];items.sort(key=lambda r:float(r["mpce_rural_rs"]))
fig,ax=plt.subplots(figsize=(10,9),layout="constrained");y=list(range(len(items)))
ax.barh([i-.18 for i in y],[float(r["mpce_rural_rs"]) for r in items],height=.35,label="Rural",color="#168078")
ax.barh([i+.18 for i in y],[float(r["mpce_urban_rs"]) for r in items],height=.35,label="Urban",color="#ed9138")
ax.set_yticks(y,[r["item_group"] for r in items]);ax.set_xlabel("Rs per person per month");ax.set_title("All-India average expenditure by item group, 2023–24",loc="left",weight="bold");ax.grid(axis="x",alpha=.25);ax.legend(frameon=False);fig.savefig(FIG/"item_composition.svg",format="svg",facecolor="#fbfaf7");plt.close(fig)
