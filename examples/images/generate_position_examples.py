"""Generate positioning example figures (top, bottom, page)."""
import matplotlib.pyplot as plt
import matplotlib.patches as patches

def create_position_figure(position_text, color, filename):
    fig, ax = plt.subplots(figsize=(12, 5))
    ax.set_xlim(0, 12)
    ax.set_ylim(0, 5)

    # Background
    gradient = patches.Rectangle((0, 0), 12, 5, facecolor=color, alpha=0.2)
    ax.add_patch(gradient)

    # Border
    border = patches.Rectangle((0.1, 0.1), 11.8, 4.8,
                                 fill=False, edgecolor=color, linewidth=4)
    ax.add_patch(border)

    # Main text
    ax.text(6, 3, f'{position_text} Figure', fontsize=28,
            ha='center', va='center', fontweight='bold', color=color)
    ax.text(6, 1.5, f'Position: [{position_text[0].lower()}]', fontsize=16,
            ha='center', va='center', color='gray')

    ax.axis('off')
    plt.tight_layout()
    plt.savefig(f'{filename}.pdf', bbox_inches='tight', dpi=300)
    plt.savefig(f'{filename}.png', bbox_inches='tight', dpi=300)
    plt.close()
    print(f"Generated: {filename}.pdf, {filename}.png")

# Create position figures
create_position_figure('Top-Positioned', '#1565C0', 'fig_top')
create_position_figure('Bottom-Positioned', '#2E7D32', 'fig_bottom')
create_position_figure('Page', '#E65100', 'fig_page')
