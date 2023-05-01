#include <iostream>
#include <cmath>

// パラメータの定義
const double L = 1.0;            // シミュレーション領域の一辺の長さ
const double H = 0.5;            // シミュレーション領域の高さ
const int NX = 100;              // x方向の格子数
const int NY = 50;               // y方向の格子数
const double DX = L / NX;        // x方向の格子間隔
const double DY = H / NY;        // y方向の格子間隔
const double DT = 0.001;         // 時間ステップ幅
const double RHO = 1.0;          // 流体の密度
const double MU = 0.01;          // 動粘性係数
const double U0 = 1.0;           // 初期速度
const double PI = 3.14159265359; // 円周率
const int NSTEPS = 1000;         // ステップ数
int n = 0;
int main() {
  // 変数の定義
    double u[NX+1][NY+2], v[NX+2][NY+1], p[NX+2][NY+2];
    double un[NX+1][NY+2], vn[NX+2][NY+1], pn[NX+2][NY+2];
    double b[NX+2][NY+2];

  // 初期条件の設定
    for (int i = 0; i <= NX; i++) {
        for (int j = 0; j <= NY+1; j++) {
            u[i][j] = 0.0;
            un[i][j] = 0.0;
        }
    }
    for (int i = 0; i <= NX+1; i++) {
        for (int j = 0; j <= NY; j++) {
            v[i][j] = 0.0;
            vn[i][j] = 0.0;
        }
    }
    for (int i = 0; i <= NX+1; i++) {
        for (int j = 0; j <= NY+1; j++) {
            p[i][j] = 0.0;
            pn[i][j] = 0.0;
        }
    }

  // 圧力ポアソン方程式の右辺bの計算
    for (int i = 1; i <= NX; i++) {
        for (int j = 1; j <= NY; j++) {
            b[i][j] = (u[i+1][j] - u[i-1][j]) / (2.0 * DX)
            + (v[i][j+1] - v[i][j-1]) / (2.0 * DY)
            / DT;
        }
    }

// 時間ステップのループ
    for (int n = 0; n < NSTEPS; n++) {
        // 境界条件の設定
        for (int j = 0; j <= NY+1; j++) {
            u[0][j] = U0;
            u[NX][j] = 0.0;
        }
        for (int i = 0; i <= NX+1; i++) {
            v[i][0] = 0.0;
            v[i][NY] = 0.0;
        }
    }

    // 速度場の更新（Adams-Bashforth法）
    for (int i = 1; i <= NX-1; i++) {
        for (int j = 1; j <= NY; j++) {
            un[i][j] = u[i][j] + DT * (
                - u[i][j] * (u[i+1][j] - u[i-1][j]) / (2.0 * DX)
                - v[i][j] * (u[i][j+1] - u[i][j-1]) / (2.0 * DY)
                - (p[i+1][j] - p[i-1][j]) / (2.0 * RHO * DX)
                + MU * ((u[i+1][j] - 2.0 * u[i][j] + u[i-1][j]) / (DX * DX)
                      + (u[i][j+1] - 2.0 * u[i][j] + u[i][j-1]) / (DY * DY))
                );
        }
    }
    for (int i = 1; i <= NX; i++) {
        for (int j = 1; j <= NY-1; j++) {
            vn[i][j] = v[i][j] + DT * (
                - u[i][j] * (v[i+1][j] - v[i-1][j]) / (2.0 * DX)
                - v[i][j] * (v[i][j+1] - v[i][j-1]) / (2.0 * DY)
                - (p[i][j+1] - p[i][j-1]) / (2.0 * RHO * DY)
                + MU * ((v[i+1][j] - 2.0 * v[i][j] + v[i-1][j]) / (DX * DX)
                      + (v[i][j+1] - 2.0 * v[i][j] + v[i][j-1]) / (DY * DY))
                );
        }
    }

    // 圧力ポアソン方程式の解法（Gauss-Seidel法）
    double residual = 1.0;
    while (residual > 1e-6) {
        residual = 0.0;
        for (int i = 1; i <= NX; i++) {
            for (int j = 1; j <= NY; j++) {
                pn[i][j] = ((pn[i+1][j] + pn[i-1][j]) * DY * DY
                    + (pn[i][j+1] + pn[i][j-1]) * DX * DX
                    - b[i][j] * DX * DX * DY * DY)
                  /(2.0 * (DX * DX + DY * DY));
                residual += fabs(b[i][j] - (pn[i+1][j] + pn[i-1][j]) * DY * DY
                - (pn[i][j+1] + pn[i][j-1]) * DX * DX
                - pn[i][j] * (2.0 * (DX * DX + DY * DY))) / (NX * NY);
            }   
        }
// 境界条件
        for (int j = 0; j <= NY+1; j++) {
        pn[0][j] = pn[1][j];
        pn[NX+1][j] = pn[NX][j];
        }
        for (int i = 0; i <= NX+1; i++) {
            pn[i][0] = pn[i][1];
            pn[i][NY+1] = 0.0;
        }
    }
    // 速度場の更新
    for (int i = 1; i <= NX-1; i++) {
        for (int j = 1; j <= NY; j++) {
            u[i][j] = un[i][j] - DT * (pn[i+1][j] - pn[i-1][j]) / (2.0 * DX * RHO);
        }
    }
    for (int i = 1; i <= NX; i++) {
        for (int j = 1; j <= NY-1; j++) {
            v[i][j] = vn[i][j] - DT * (pn[i][j+1] - pn[i][j-1]) / (2.0 * DY * RHO);
        }
    }

    // 結果の表示
    if (n % 10 == 0) {
        // vtkファイルへの出力
        char filename[256];
        sprintf(filename, "result_%04d.vtk", n);
        writeVTK(filename, x, y, u, v);
    }
}


