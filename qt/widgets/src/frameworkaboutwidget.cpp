#include "frameworkaboutwidget.hpp"

#include "core/version.hpp"

#include <QHBoxLayout>
#include <QLabel>

using framework::core::version_string;

FrameworkAboutWidget::FrameworkAboutWidget(QWidget *parent) : QWidget(parent) {
  this->setLayout(new QHBoxLayout());
  auto layout = this->layout();
  layout->addWidget(new QLabel("Framework Version:", this));
  layout->addWidget(new QLabel(QString::fromStdString(version_string()), this));
}