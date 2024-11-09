#include <print>
#include <Eigen/Dense>


// ref: https://qiita.com/shiro-kuma/items/0faa02aa064a3c0a460b
signed main() {
  Eigen::MatrixXf m(2,4);
  Eigen::VectorXf v(2);

  m << 1, 23, 6, 9,
       3, 11, 7, 2;

  v << 2,
       3;

  Eigen::MatrixXf::Index index;

  (m.colwise() - v).colwise().squaredNorm().minCoeff(&index);

  std::println("Nearest neighbor is column {} : {}", index, m.col(index));
}
