"""Generate data/experimental results graph."""
import matplotlib.pyplot as plt
import numpy as np

fig, ax = plt.subplots(figsize=(12, 7))

years = [2020, 2021, 2022, 2023, 2024, 2025]
value_a = [10, 15, 20, 25, 30, 35]
value_b = [20, 25, 30, 35, 40, 45]
value_c = [30, 35, 40, 45, 50, 55]

ax.plot(years, value_a, 'o-', linewidth=2.5, markersize=10,
        label='Value A', color='#1E88E5')
ax.plot(years, value_b, 's-', linewidth=2.5, markersize=10,
        label='Value B', color='#43A047')
ax.plot(years, value_c, '^-', linewidth=2.5, markersize=10,
        label='Value C', color='#FB8C00')

ax.fill_between(years, value_a, alpha=0.1, color='#1E88E5')
ax.fill_between(years, value_b, alpha=0.1, color='#43A047')
ax.fill_between(years, value_c, alpha=0.1, color='#FB8C00')

ax.set_xlabel('Year', fontsize=14, fontweight='bold')
ax.set_ylabel('Value', fontsize=14, fontweight='bold')
ax.set_title('Experimental Results Over Time', fontsize=16, fontweight='bold')
ax.legend(loc='upper left', fontsize=12)
ax.grid(True, alpha=0.3)
ax.set_xlim(2019.5, 2025.5)
ax.set_ylim(0, 60)

plt.tight_layout()
plt.savefig('fig_data.pdf', bbox_inches='tight', dpi=300)
plt.savefig('fig_data.png', bbox_inches='tight', dpi=300)
print("Generated: fig_data.pdf, fig_data.png")
